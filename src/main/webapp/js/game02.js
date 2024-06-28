class game02 extends Phaser.Scene {

    constructor() {
        super({key:"game02"});
        this.boxes = [];
        this.planets = ['earth', 'venus', 'mercury', 'saturn'];
        this.frame = 0;
        this.timer = 0;
        this.tileSpeed = 2;
        this.circleCenter = {x:300, y:300};
        this.circleRadius = 300;
        this.highScore = 0;
        this.gameRank = 1; // 게임 랭크 초기화
        this.userId = null; // 유저 ID 초기화
        this.userSeq = null;
        this.gameSeq = 2;
    }

    init(){
        this.timer = 0;
        this.tileSpeed = 2;
        this.highScore = localStorage.getItem('highScore') || 0; // 로컬 스토리지에서 최고 기록을 가져옴
        this.gameRank = 1; // 게임 랭크 초기화
        this.userId = sessionStorage.getItem('userName'); // 유저 ID 초기화
    }

    preload() {
        this.load.image('player', '/image/player.png');
        this.load.image('comet', '/image/comet.png');
        this.load.image('background', '/image/background.jpg');
        this.load.image('earth', '/image/earth.png');
        this.load.image('venus', '/image/venus.png');
        this.load.image('mercury', '/image/mercury.png');
        this.load.image('saturn', '/image/saturn.png');
    }

    create() {
        this.cameras.main.setBackgroundColor("ffffff");

        this.background = this.add.tileSprite(0, 0, this.cameras.main.width, this.cameras.main.height, 'background');
        this.background.setOrigin(0, 0);

        // bottomBoundary 생성
        let bottomBoundary = this.add.rectangle(0, this.cameras.main.height+30, this.cameras.main.width, 5, 0x000000);
        bottomBoundary.setOrigin(0, 0);
        this.physics.add.existing(bottomBoundary, true);
        this.physics.add.collider(this.boxes, bottomBoundary, (box, boundary) => {
            box.destroy();
            this.boxes.splice(this.boxes.indexOf(box), 1);
        });

        // planets와 bottomBoundary 충돌 처리 추가
        this.physics.add.collider(this.planets, bottomBoundary, (planet, boundary) => {
            planet.destroy();
            this.planets.splice(this.planets.indexOf(planet), 1);
        });

        // topBoundary 생성
        let topBoundary = this.add.rectangle(0, -30, this.cameras.main.width, 5, 0x000000);
        topBoundary.setOrigin(0, 0);
        this.physics.add.existing(topBoundary, true);
        this.physics.add.collider(this.boxes, topBoundary, (box, boundary) => {
            box.destroy();
            this.boxes.splice(this.boxes.indexOf(box), 1);
        });

        // leftBoundary 생성
        let leftBoundary = this.add.rectangle(-30, 0, 5, this.cameras.main.height, 0x000000);
        leftBoundary.setOrigin(0, 0);
        this.physics.add.existing(leftBoundary, true);
        this.physics.add.collider(this.boxes, leftBoundary, (box, boundary) => {
            box.destroy();
            this.boxes.splice(this.boxes.indexOf(box), 1);
        });

        // rightBoundary 생성
        let rightBoundary = this.add.rectangle(this.cameras.main.width+30, 0, 5, this.cameras.main.height, 0x000000);
        rightBoundary.setOrigin(0, 0);
        this.physics.add.existing(rightBoundary, true);
        this.physics.add.collider(this.boxes, rightBoundary, (box, boundary) => {
            box.destroy();
            this.boxes.splice(this.boxes.indexOf(box), 1);
        });

        this.player = this.physics.add.sprite(this.cameras.main.width / 2,
            this.cameras.main.height / 2, 'player');
        this.player.setCollideWorldBounds(true);

        this.player.setDepth(1);

        let scaleFactor = 30 / 512;
        this.player.setScale(scaleFactor);
        this.player.setSize(20 / scaleFactor, 45 / scaleFactor);

        this.physics.add.collider(this.player, this.boxes, (player, boxes) => {
            /*this.scene.start("gameOver02");*/
            this.scene.get('gameOver02').data.set('timer', this.timer); // Timer 값을 GameOver 페이지에 보냄
            this.gameOver02(this.userSeq,this.gameSeq);
        });

        this.timerText = this.add.text(this.cameras.main.width - 300, 10, '0', {
            fontSize: '32px',
            fill: '#FF0000'
        });

        this.cursor = this.input.keyboard.createCursorKeys();
    }

    update() {
        this.frame++;
        this.background.tilePositionY -= this.tileSpeed;

        if (this.frame % 60 == 0) {
            this.timer++;
            this.timerText.setText(this.timer);

            let box = this.physics.add.sprite(Math.random() * (480 - 20 + 1) + 20, 20, 'comet');
            box.setVelocityY(Math.random() * (200 - 100 + 1) + 100);
            let scalefactor = 20 / 500;
            box.setScale(scalefactor);
            box.setSize(25 / scalefactor, 25 / scalefactor);
            this.boxes.push(box);

            if (this.timer >= 10) {
                let box = this.physics.add.sprite(Math.random() * (480 - 20 + 1) + 20, this.cameras.main.height, 'comet');
                box.setVelocityY(-(Math.random() * (200 - 100 + 1) + 100));
                let scalefactor = 20 / 500;
                box.setScale(scalefactor);
                box.setSize(25 / scalefactor, 25 / scalefactor);
                this.boxes.push(box);
                this.tileSpeed = 5;
            }

            if (this.timer >= 15) {
                let box = this.physics.add.sprite(0, Math.random() * (480 - 20 + 1) + 20, 'comet');
                box.setVelocityX(Math.random() * (200 - 100 + 1) + 100);
                let scalefactor = 20 / 500;
                box.setScale(scalefactor);
                box.setSize(25 / scalefactor, 25 / scalefactor);
                this.boxes.push(box);
                this.tileSpeed = 7;
            }

            if (this.timer >= 20){
                let box = this.physics.add.sprite(this.cameras.main.width, Math.random() * (480 - 20 + 1) + 20, 'comet');
                box.setVelocityX(-(Math.random() * (200 - 100 + 1) + 100));
                box.setScale(scalefactor);
                box.setSize(25 / scalefactor, 25 / scalefactor);
                this.boxes.push(box);
                this.tileSpeed = 10;
            }
            
            // 행성 추가 로직
            if (this.timer % 5 === 0) {  // 5초마다 행성 생성
                let randomIndex = Phaser.Math.RND.between(0, 3); // 0, 1, 2, 3 사이의 랜덤 인덱스
                let planetKey = this.planets[randomIndex]; // 무작위 행성 이미지
                console.log('Selected Planet:', planetKey);
                let planet = this.physics.add.sprite(Math.random() * this.cameras.main.width, 20,  planetKey);
            planet.setVelocityY(Math.random() * (200 - 100 + 1) + 100);
            let scalefactor = 100 / 500;
            planet.setScale(scalefactor);
            planet.setSize(25 / scalefactor, 25 / scalefactor);
            this.planets.push(planet);
            console.log('Planets Array:', this.planets);
            }
            
        }

        // 원형 경계 내에서만 플레이어가 움직이도록 제한
        let speed = 300;
        if (this.isReversed) {
            if (this.cursor.left.isDown) {
                this.player.setVelocityX(speed);
            } else if (this.cursor.right.isDown) {
                this.player.setVelocityX(-speed);
            } else {
                this.player.setVelocityX(0);
            }

            if (this.cursor.up.isDown) {
                this.player.setVelocityY(speed);
            } else if (this.cursor.down.isDown) {
                this.player.setVelocityY(-speed);
            } else {
                this.player.setVelocityY(0);
            }
        } else {
            if (this.cursor.left.isDown) {
                this.player.setVelocityX(-speed);
            } else if (this.cursor.right.isDown) {
                this.player.setVelocityX(speed);
            } else {
                this.player.setVelocityX(0);
            }

            if (this.cursor.up.isDown) {
                this.player.setVelocityY(-speed);
            } else if (this.cursor.down.isDown) {
                this.player.setVelocityY(speed);
            } else {
                this.player.setVelocityY(0);
            }
        }

        // 플레이어가 원형 경계를 벗어나지 않도록 위치 조정
        let distanceFromCenter = Phaser.Math.Distance.Between(this.player.x, this.player.y, this.circleCenter.x, this.circleCenter.y);
        if (distanceFromCenter > this.circleRadius) {
            let angle = Phaser.Math.Angle.Between(this.circleCenter.x, this.circleCenter.y, this.player.x, this.player.y);
            this.player.x = this.circleCenter.x + this.circleRadius * Math.cos(angle);
            this.player.y = this.circleCenter.y + this.circleRadius * Math.sin(angle);
        }
  

        if (this.cursor.left.isDown) {
            this.player.setVelocityX(-200);
        } else if (this.cursor.right.isDown) {
            this.player.setVelocityX(200);
        } else {
            this.player.setVelocityX(0);
        }

        if (this.cursor.up.isDown) {
            this.player.setVelocityY(-200);
        } else if (this.cursor.down.isDown) {
            this.player.setVelocityY(200);
        } else {
            this.player.setVelocityY(0);
        }
    }
    
    gameOver02(userSeq, gameSeq) {
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

        this.scene.start('gameOver02', { score: this.timer, highScore: this.highScore });
    }
}
