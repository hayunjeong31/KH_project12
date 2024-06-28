class game03 extends Phaser.Scene {

    constructor() {
        super({ key: "game03" });
        this.boxes = [];
        this.bullets = [];
        this.frame = 0;
        this.timer = 0;
        this.tileSpeed = 2;
        this.spawnInterval = 10;
        this.enemyCount = 8;
        this.spawnState = 0; // 스폰 상태
        this.bulletCount = 0; // 총알 발사 개수 카운트
        this.bonusBox = null; // 보너스 박스
        this.bonusBoxHitCount = 0; // 보너스 박스 맞힌 횟수
        this.bonusBoxText = null; // 보너스 박스 텍스트 
        this.requiredHits = 15; // 맞혀야 하는 횟수 초기화
        this.gameRank = 1; // 게임 랭크 초기화
        this.userId = null; // 유저 ID 초기화
        
        this.highScore = 0;
       
         this.userSeq = null; // 유저 시퀀스 초기화
         this.gameSeq = 3; // 게임 시퀀스 초기화

        
    }

    init() {
        this.timer = 0;
        this.enemyCount = 8;
        this.bonusBoxHitCount = 0; // 초기화: 보너스 박스 맞힌 횟수
        this.requiredHits = 15; // 초기화: 맞혀야 하는 횟수
        this.gameRank = 1; // 게임 랭크 초기화
        this.userId = sessionStorage.getItem('userName'); // 유저 ID 초기화
        this.highScore = localStorage.getItem('highScore') || 0; // 로컬 스토리지에서 최고 기록을 가져옴
	 	this.userSeq = null; // 유저 시퀀스 초기화
         this.gameSeq = 3; // 게임 시퀀스 초기화
    }

    preload() {
        this.load.image('keyplayer', '../image/gun.png');
        this.load.image('background', '../image/backroad.jpg');
        this.load.image('bullet', '../image/bullet2.png');
        this.load.image('bonusBox', '../image/blueframe.webp');
        this.load.spritesheet('villain2','../image/abc1.png',{frameWidth:127.8,frameHeight:128});
    }

    create() {
        this.cameras.main.setBackgroundColor("#ffffff");
        this.background = this.add.tileSprite(0, 0, this.cameras.main.width, this.cameras.main.height, 'background');
        this.background.setOrigin(0, 0);
        let scalefactor2 = 600 / 515;
        this.background.setScale(scalefactor2);
        this.background.setSize(600 / scalefactor2, 600 / scalefactor2);

        // player
        this.player = this.physics.add.sprite(this.cameras.main.width / 2, 550, 'keyplayer');
        this.player.setCollideWorldBounds(true);
 
        let scalefactor3 = 30 / 300;
        this.player.setScale(scalefactor3);
        this.player.setSize(25 / scalefactor3, 15 / scalefactor3);

        this.physics.add.collider(this.player, this.boxes, (player, box) => {
            //this.scene.start("gameOver03");
            this.scene.get("gameOver03").data.set("timer",this.timer);
            this.gameOver03(this.userSeq,this.gameSeq);
        });

        // Boundary
        this.bottomBoundary = this.add.rectangle(0, 560, this.cameras.main.width, 5);
        this.bottomBoundary.setOrigin(0, 0);

        let leftBoundary = this.add.rectangle(200, 0, 5, this.cameras.main.height);
        leftBoundary.setOrigin(0, 0);

        let rightBoundary = this.add.rectangle(400, 0, 5, this.cameras.main.height);
        rightBoundary.setOrigin(0, 0);

        this.physics.add.existing(this.bottomBoundary, true);
        this.physics.add.existing(leftBoundary, true);
        this.physics.add.existing(rightBoundary, true);

        this.physics.add.collider(this.player, leftBoundary);
        this.physics.add.collider(this.player, rightBoundary);

        // Timer 
        this.timerText = this.add.text(this.cameras.main.width - 150, 100, '0', {
            fontSize: '32px', fill: 'rgb(55, 55, 169)',
            fontFamily: "GalmuriMono9", 
            fontWeight: 'bold' // 폰트 두께 설정
        });

        // 적 생성 minX maxX
        this.spawnEnemies(210, 300);

        // box랑 바닥 Boundary랑 부딪히면 gameover
        this.physics.add.collider(this.boxes, this.bottomBoundary, (box, boundary) => {
           // this.scene.start("gameOver03");
			this.scene.get("gameOver03").data.set("timer",this.timer);
            this.gameOver03(this.userSeq,this.gameSeq);

        });

        this.cursor = this.input.keyboard.createCursorKeys();
        this.input.keyboard.on('keydown-SPACE', this.handleSpacebar, this);
    }

    handleSpacebar() {
        if (this.bonusBoxHitCount >= 15) {
            this.input.keyboard.off('keydown-SPACE', this.handleSpacebar, this);
            this.input.keyboard.on('keydown-SPACE', this.shootMultipleBullets, this);
            this.shootMultipleBullets();
        } else {
            this.shootBullet();
        }
    }

    shootBullet() {
        let bullet = this.physics.add.sprite(this.player.x, this.player.y, 'bullet');
        bullet.setScale(0.1);
        bullet.setVelocityY(-200);
        this.bullets.push(bullet);

        this.physics.add.collider(bullet, this.boxes, (bullet, box) => {
            bullet.destroy();
            box.destroy();
            this.bullets.splice(this.bullets.indexOf(bullet), 1);
            this.boxes.splice(this.boxes.indexOf(box), 1);
        });

        this.physics.add.overlap(bullet, this.bonusBox, this.hitBonusBox, null, this);
    }

    shootMultipleBullets() {
        for (let i = 0; i < 1 + this.bulletCount; i++) {
            this.shootBullet();
        }
    }

    spawnEnemies(minX, maxX) {
        this.anims.create({ 
            key: "run",
            frames: this.anims.generateFrameNumbers('villain2', { start: 0, end: 8 }),
            frameRate: 20,
            repeat: -1
        });

        let numCols = 5;
        let numRows = Math.ceil(this.enemyCount / numCols);

        for (let i = 0; i < this.enemyCount; i++) {
            let col = i % numCols;
            let x = minX + (col * (maxX - minX) / (numCols - 1));
            let row = Math.floor(i / numCols);
            let y = 20 - row * 20;

            let box = this.physics.add.sprite(x, y, 'villain2');
            let scaleFactor = 130 / 360;
            box.setScale(scaleFactor);
            box.setSize(20 / scaleFactor, 20 / scaleFactor);
            box.setVelocityY(60);
            box.anims.play({ key: 'run' });

            this.boxes.push(box);
        }
    }

    update() {
        if (this.cursor.left.isDown) {
            this.player.setVelocityX(-200);
        } else if (this.cursor.right.isDown) {
            this.player.setVelocityX(200);
        } else {
            this.player.setVelocityX(0);
        }

        this.background.tilePositionY -= this.tileSpeed;
        this.frame++;

        if (this.frame % 60 === 0) {
            this.timer++;
            this.timerText.setText(this.timer);

            if (this.timer % 10 === 5) {
                this.spawnBonusBox();
            }

            if (this.timer % this.spawnInterval === 0) {
                this.enemyCount += 6;

                if (this.spawnState === 0) {
                    this.spawnEnemies(252, 390);
                    this.spawnState = 1;
                } else if (this.spawnState === 1) {
                    this.spawnEnemies(210, 390);
                    this.spawnState = 2;
                } else if (this.spawnState === 2) {
                    this.spawnEnemies(240, 390);
                    this.spawnState = 3;
                } else {
                    this.spawnEnemies(210, 250);
                    this.spawnState = 0;
                }
            }
        }

        if (this.bonusBox) {
            this.bonusBoxText.setPosition(this.bonusBox.x, this.bonusBox.y);
        }
    }

    spawnBonusBox() {
        // 기존 보너스 박스와 텍스트가 존재하면 제거
        if (this.bonusBox) {
            this.bonusBox.destroy();
            this.bonusBoxText.destroy();
        }

        let x = Phaser.Math.Between(210, 390);
        this.bonusBox = this.physics.add.sprite(x, 0, 'bonusBox');
        this.bonusBox.setVelocityY(60);

        // 맞혀야 하는 횟수 증가
        if (!this.requiredHits || this.bonusBoxHitCount >= this.requiredHits) {
            this.requiredHits = 15;
        } 

        this.bonusBoxText = this.add.text(this.bonusBox.x, this.bonusBox.y, this.requiredHits.toString(), {
            fontSize: '24px', fill: '#000000'
        });

        let scalefactor0 = 100 / 871;
        this.bonusBox.setScale(scalefactor0);
        this.bonusBoxText.setOrigin(0.5);

        this.physics.add.overlap(this.bonusBox, this.bottomBoundary, () => {
            this.bonusBoxText.destroy();
            this.bonusBox.destroy();
        });

        this.physics.add.overlap(this.bonusBox, this.bullets, this.hitBonusBox, null, this);
        this.bonusBoxHitCount = 0;
    }

    hitBonusBox(bonusBox, bullet) {
        bullet.destroy();
        this.bonusBoxHitCount++;

        let remainingHits = this.requiredHits - this.bonusBoxHitCount;
        this.bonusBoxText.setText(remainingHits.toString());

        if (this.bonusBoxHitCount >= this.requiredHits) {
            this.bonusBox.destroy();
            this.bonusBoxText.destroy();
            this.bonusBoxHitCount = 0;
             // 보너스 박스 맞힌 횟수 증가
            this.requiredHits *= 2;
            this.input.keyboard.on('keydown-SPACE', this.shootMultipleBullets, this);
            this.input.keyboard.off('keydown-SPACE', this.shootBullet, this);
        }
    }
    
    gameOver03(userSeq, gameSeq) {
        if (this.timer > this.highScore) {
            this.highScore = this.timer;
            localStorage.setItem('highScore', this.highScore); // 새로운 최고 기록 저장
        }

        // AJAX 요청을 통해 서버에 데이터 전송
        var xhr = new XMLHttpRequest();
        var params = new URLSearchParams({
            action: 'save',
            userSeq: this.userSeq,
            gameSeq: this.gameSeq,
            gameScore: this.timer,
            gameRank: this.gameRank, // 게임 랭크를 실제로 전송
            userId: this.userId // 세션에서 가져온 userId 사용
        }).toString();
        
        xhr.open("GET", `/games/gamesServlet.games?${params}`, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                console.log("Game score saved successfully!");
            }
        };
        xhr.send();

        this.scene.start('gameOver03', { score: this.timer, highScore: this.highScore });
    }
    
    
}
