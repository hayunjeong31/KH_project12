class game01 extends Phaser.Scene {
    constructor() {
        super({ key: "game01" });
        this.boxes = [];
        this.boundaries = [];
        this.frame = 0;
        this.timer = 0;
        this.tileSpeed = 3;
        this.spawnCount = 2;
        this.gameStarted = false;
        this.highScore = 0;
        this.playerSizeFactor = 1; // 플레이어 크기 조절
        this.isReversed = false; // 방향키 반전 여부
        this.circleCenter = { x: 300, y: 300 }; // 원형 중심
        this.circleRadius = 300; // 원형 반지름
        this.gameRank = 1; // 게임 랭크 초기화
        this.userId = null; // 유저 ID 초기화
    }

    init() {
        this.timer = 0;
        this.spawnCount = 1;
        this.frame = 0;
        this.boxes = [];
        this.tileSpeed = 100; // 초기 속도 설정
        this.gameStarted = false;
        this.highScore = localStorage.getItem('highScore') || 0; // 로컬 스토리지에서 최고 기록을 가져옴
        this.playerSizeFactor = 1; // 플레이어 크기 초기화
        this.isReversed = false; // 방향키 반전 초기화
        this.gameRank = 1; // 게임 랭크 초기화
        this.userId = sessionStorage.getItem('userName'); // 유저 ID 초기화
    }

    preload() {
        this.load.image('player', '/image/pplayer.png');
        this.load.image('ghost', '/image/ghost.png');
        this.load.image('ball', '/image/ball.png'); // 볼 이미지 로드
        this.load.image('mushroom', '/image/mushroom.png'); // 버섯 이미지 로드
        this.load.image('calamari', '/image/calamari.png'); // 오징어 이미지 로드
        this.load.image('background', '/image/background3.jpg'); // 배경 이미지 로드
    }

    create() {
        this.cameras.main.setBackgroundColor("#ffffff");

        this.background = this.add.sprite(this.cameras.main.width / 2, this.cameras.main.height / 2, 'background');
        this.background.setOrigin(0.5, 0.5);
        this.background.displayWidth = this.cameras.main.width;
        this.background.displayHeight = this.cameras.main.height;

        this.physics.world.setBoundsCollision(true, true, true, true);

        this.boundaries.push(this.add.rectangle(0, this.cameras.main.height + 30, this.cameras.main.width, 5, 0x000000));
        this.boundaries.push(this.add.rectangle(0, -30, this.cameras.main.width, 5, 0x000000));
        this.boundaries.push(this.add.rectangle(-30, 0, 5, this.cameras.main.height, 0x000000));
        this.boundaries.push(this.add.rectangle(this.cameras.main.width + 30, 0, 5, this.cameras.main.height, 0x000000));

        for (let boundary of this.boundaries) {
            boundary.setOrigin(0, 0);
            this.physics.add.existing(boundary, true);
        }

        // 플레이어를 화면 중앙에 배치
        this.player = this.physics.add.sprite(this.cameras.main.width / 2, this.cameras.main.height / 2, 'player');
        this.setPlayerSize();

        this.player.setCollideWorldBounds(true);

        this.physics.add.collider(this.player, this.boxes, (player, box) => {
            if (box.texture.key === 'mushroom') {
                this.eatMushroom();
            } else if (box.texture.key === 'calamari') {
                this.reverseControls();
            } else {
                this.shrinkPlayer();
            }
            this.removeBox(box);
        });

        // 배경 위에 큰 시간 텍스트 추가
        this.bigTimerText = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2, '0', {
            fontSize: '256px',
            fill: '#FFFFFF' // 흰색으로 변경
        }).setOrigin(0.5, 0.5);
        this.bigTimerText.setAlpha(0.2); // 불투명도 조정

        this.timerText = this.add.text(this.cameras.main.width - 10, 10, '0', {
            fontSize: '32px',
            fill: '#FF0000'
        }).setOrigin(1, 0);

        this.rankText = this.add.text(10, 10, 'Rank: 1', {
            fontSize: '32px',
            fill: '#FF0000'
        }).setOrigin(0, 0);

        this.cursor = this.input.keyboard.createCursorKeys();

        // 게임 설명 텍스트 추가
        this.gameDescription = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 50, 
            '게임 설명: 방향키로 플레이어를 이동하세요.\n주의사항 : Ball = 폭죽 효과, calamari : 키보드 방향전환. \nTip. 버섯 많이 먹기 \n유령과 볼이랑 충돌하면 게임 오버입니다.', {
            fontSize: '18px', // 폰트 크기 줄임
            fill: '#FFFFFF',
            fontFamily: 'Arial', // 폰트 설정
            align: 'center'
        }).setOrigin(0.5, 0.5);

        // 게임 시작 버튼 추가
        this.startButton = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 120, '게임 시작', {
            fontSize: '30px',
            fill: '#FFFFFF',
            fontFamily: 'Arial', // 폰트 설정
        }).setOrigin(0.5, 0.5).setInteractive();

        this.startButton.on('pointerdown', () => {
            this.startGame();
        });

        // 플레이어와 타이머 텍스트를 처음에는 숨김
        this.player.setVisible(false);
        this.timerText.setVisible(false);
        this.bigTimerText.setVisible(false);
        this.rankText.setVisible(false);
        this.gameDescription.setVisible(false);
        this.startButton.setVisible(false);
    }

    startGame() {
        this.gameStarted = true;
        this.timer = 0;
        this.spawnCount = 1;
        this.frame = 0;
        this.userId = sessionStorage.getItem('userName'); // 세션에서 userId를 가져옴

        // 게임 설명과 시작 버튼 숨기기
        this.gameDescription.setVisible(false);
        this.startButton.setVisible(false);

        // 플레이어와 타이머 텍스트 보이기
        this.player.setVisible(true);
        this.timerText.setVisible(true);
        this.bigTimerText.setVisible(true);
        this.rankText.setVisible(true);
    }

    update() {
        if (!this.gameStarted) {
            this.startButton.setVisible(true);
            this.gameDescription.setVisible(true);
            return;
        }

        this.frame++;

        if (this.frame % 60 === 0) {
            this.timer++;
            this.timerText.setText(this.timer);
            this.bigTimerText.setText(this.timer);

            if (this.timer % 5 === 0) {
                this.gameRank++;
                this.rankText.setText('Rank: ' + this.gameRank);
            }

            if (this.timer % 20 === 0) {
                this.spawnMushroom(); // 20초마다 버섯 생성
            }

            if (this.timer % 10 === 0) {
                this.spawnBall(2); // 10초마다 볼 생성
                this.tileSpeed += 20; // 10초마다 속도 증가
            }

            if (this.timer % 10 == 0) {
                this.spawnCalamari(1); // 10초마다 오징어 생성
            }

            if (this.timer >= 10) {
                this.spawnCount = 5;
                if (this.timer % 10 === 0) {
                    this.spawnCluster(5);
                }
            } else if (this.timer >= 5) {
                this.spawnCount = 3;
            }
        }

        if (this.frame % 60 === 0) {
            this.spawnArrows(this.spawnCount);
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
    }

    spawnArrows(count) {
        let spacing = 20; // 간격 설정
        for (let i = 0; i < count; i++) {
            let angle = Phaser.Math.Between(0, 360);
            let radians = Phaser.Math.DegToRad(angle);
            let radius = 300;
            
            // 각 박스의 시작 위치를 계산
            let x = this.cameras.main.width / 2 + radius * Math.cos(radians) + i * spacing;
            let y = this.cameras.main.height / 2 + radius * Math.sin(radians) + i * spacing;

            let box = this.physics.add.sprite(x, y, 'ghost');
            box.setDisplaySize(20, 20); // 더 큰 크기로 설정
            this.physics.moveToObject(box, this.player, this.tileSpeed); // 속도 적용
            this.physics.add.collider(box, this.boundaries, () => this.removeBox(box));
            this.boxes.push(box);
        }
    }

    spawnCluster(count) {
        let angle = Phaser.Math.Between(0, 360);
        let radians = Phaser.Math.DegToRad(angle);
        let radius = 300;
        let spacing = 20; // 간격 설정

        for (let i = 0; i < count; i++) {
            // 각 박스의 시작 위치를 계산
            let x = this.cameras.main.width / 2 + (radius + i * spacing) * Math.cos(radians);
            let y = this.cameras.main.height / 2 + (radius + i * spacing) * Math.sin(radians);

            let box = this.physics.add.sprite(x, y, 'ghost');
            box.setDisplaySize(20, 20); // 더 큰 크기로 설정
            this.physics.moveToObject(box, this.player, this.tileSpeed); // 속도 적용
            this.physics.add.collider(box, this.boundaries, () => this.removeBox(box));
            this.boxes.push(box);
        }
    }

    spawnBall(count) {
        for (let i = 0; i < count; i++) {
            let angle = Phaser.Math.Between(0, 360);
            let radians = Phaser.Math.DegToRad(angle);
            let radius = 300;
            let x = this.cameras.main.width / 2 + radius * Math.cos(radians);
            let y = this.cameras.main.height / 2 + radius * Math.sin(radians);

            let ball = this.physics.add.sprite(x, y, 'ball');
            ball.setDisplaySize(50, 50); // 큰 크기로 생성
            this.physics.moveToObject(ball, this.player, this.tileSpeed); // 속도 적용
            this.physics.add.collider(ball, this.boundaries, () => this.removeBox(ball));
            this.time.delayedCall(2000, () => {
                this.createExplosion(ball.x, ball.y); // 폭죽 효과
                this.removeBox(ball);
            });
            this.boxes.push(ball);
        }
    }

    spawnMushroom() {
        let angle = Phaser.Math.Between(0, 360);
        let radians = Phaser.Math.DegToRad(angle);
        let radius = 300;
        let x = this.cameras.main.width / 2 + radius * Math.cos(radians);
        let y = this.cameras.main.height / 2 + radius * Math.sin(radians);

        let mushroom = this.physics.add.sprite(x, y, 'mushroom');
        mushroom.setDisplaySize(50, 50); // 큰 크기로 생성
        mushroom.setCollideWorldBounds(true); // 화면 밖으로 나가지 않도록 설정
        mushroom.setBounce(1); // 버섯이 튕기도록 설정
        this.physics.moveToObject(mushroom, this.player, this.tileSpeed); // 속도 적용
        this.physics.add.collider(mushroom, this.boundaries, () => this.removeBox(mushroom));
        this.boxes.push(mushroom);
    }

    spawnCalamari(count) {
        for (let i = 0; i < count; i++) {
            let angle = Phaser.Math.Between(0, 360);
            let radians = Phaser.Math.DegToRad(angle);
            let radius = 300;
            let x = this.cameras.main.width / 2 + radius * Math.cos(radians);
            let y = this.cameras.main.height / 2 + radius * Math.sin(radians);

            let calamari = this.physics.add.sprite(x, y, 'calamari');
            calamari.setDisplaySize(50, 50); // 큰 크기로 생성
            calamari.setCollideWorldBounds(true); // 화면 밖으로 나가지 않도록 설정
            calamari.setBounce(1); // 오징어가 튕기도록 설정
            this.physics.moveToObject(calamari, this.player, this.tileSpeed); // 속도 적용
            this.physics.add.collider(calamari, this.boundaries, () => this.removeBox(calamari));
            this.time.delayedCall(5000, () => {
                this.removeBox(calamari);
            });
            this.boxes.push(calamari);
        }
    }

    createExplosion(x, y) {
        for (let i = 0; i < 5; i++) {
            let angle = Phaser.Math.Between(0, 360);
            let radians = Phaser.Math.DegToRad(angle);
            let explosionRadius = 50;
            let ex = x + explosionRadius * Math.cos(radians);
            let ey = y + explosionRadius * Math.sin(radians);

            let box = this.physics.add.sprite(ex, ey, 'ghost');
            box.setDisplaySize(20, 20); // 더 큰 크기로 설정
            this.physics.moveToObject(box, this.player, this.tileSpeed); // 속도 적용
            this.physics.add.collider(box, this.boundaries, () => this.removeBox(box));
            this.boxes.push(box);
        }
    }

    eatMushroom() {
        this.playerSizeFactor++;
        this.setPlayerSize();
    }

    shrinkPlayer() {
        if (this.playerSizeFactor > 1) {
            this.playerSizeFactor--;
            this.setPlayerSize();
        } else {
            this.gameOver(1, 1); // 예시로 userSeq, gameSeq 전달
        }
    }

    setPlayerSize() {
        let scaleFactor = (35 * this.playerSizeFactor) / 512;
        this.player.setScale(scaleFactor);
        this.player.setSize(15 / scaleFactor, 15 / scaleFactor);
    }

    reverseControls() {
        this.isReversed = true;
        this.time.delayedCall(3000, () => {
            this.isReversed = false;
        });
    }

    removeBox(box) {
        const index = this.boxes.indexOf(box);
        if (index > -1) {
            this.boxes.splice(index, 1);
        }
        box.destroy();
    }

    gameOver(userSeq, gameSeq) {
        if (this.timer > this.highScore) {
            this.highScore = this.timer;
            localStorage.setItem('highScore', this.highScore); // 새로운 최고 기록 저장
        }

        // AJAX 요청을 통해 서버에 데이터 전송
        var xhr = new XMLHttpRequest();
        var params = new URLSearchParams({
            action: 'save',
            userSeq: userSeq,
            gameSeq: gameSeq,
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

        this.scene.start('gameOver01', { score: this.timer, highScore: this.highScore });
    }
}
