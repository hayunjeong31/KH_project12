class game04 extends Phaser.Scene {
    constructor() {
        super({ key: 'game04' });
        this.ball = null;
        this.paddle = null;
        this.bricks = null;
        this.scoreText = null;
        this.livesText = null;
        this.lifeLostText = null;
        this.startButton = null;
        this.score = 0;
        this.lives = 3;
        this.playing = false;
        this.highScore = 0;
        this.userId = null; // 유저 ID 초기화
        this.gameRank = 1; // 게임 랭크 초기화       
    }

    init() {
        this.ball = null;
        this.paddle = null;
        this.bricks = null;
        this.scoreText = null;
        this.livesText = null;
        this.lifeLostText = null;
        this.startButton = null;
        this.score = 0;
        this.lives = 3;
        this.playing = false;
        this.highScore = localStorage.getItem('highScore') || 0; // 로컬 스토리지에서 최고 기록을 가져옴
        this.gameRank = 1; // 게임 랭크 초기화
        this.userId = sessionStorage.getItem('userName'); // 유저 ID 초기화       
    }

    preload() {
        this.load.crossOrigin = 'anonymous';
        this.load.spritesheet('ball', 'https://end3r.github.io/Gamedev-Phaser-Content-Kit/demos/img/wobble.png', { frameWidth: 20, frameHeight: 20 });
        this.load.spritesheet('button', 'https://end3r.github.io/Gamedev-Phaser-Content-Kit/demos/img/button.png', { frameWidth: 120, frameHeight: 40 });
        this.load.image('paddle', 'https://end3r.github.io/Gamedev-Phaser-Content-Kit/demos/img/paddle.png');
        this.load.image('brick1', '/image/Brick1.png');
        this.load.image('brick2', '/image/Brick2.png');
        this.load.image('brick3', '/image/Brick3.png');
        this.load.image('brick4', '/image/Brick4.png');
        this.load.image('brick5', '/image/Brick5.png');
        this.load.image('background', '/image/9.png');
    }

    create() {
        this.add.image(0, 0, 'background').setOrigin(0).setDisplaySize(this.scale.width, this.scale.height);

        this.ball = this.physics.add.sprite(this.scale.width * 0.5, this.scale.height - 25, 'ball');
        this.anims.create({
            key: 'wobble',
            frames: this.anims.generateFrameNumbers('ball', { frames: [0, 1, 0, 2, 0, 1, 0, 2, 0] }),
            frameRate: 24
        });

        this.ball.body.allowGravity = false;
        this.ball.body.collideWorldBounds = true;
        this.ball.body.bounce.set(1);

        this.paddle = this.physics.add.sprite(this.scale.width * 0.5, this.scale.height - 5, 'paddle');
        this.paddle.body.allowGravity = false;
        this.paddle.body.immovable = true;

        this.physics.world.checkCollision.down = true;
        this.ball.body.onWorldBounds = true;
        this.physics.world.on('worldbounds', (body, blockedUp, blockedDown) => {
            if (blockedDown) {
                this.fnBallLeaveScreen();
            }
        });

        this.physics.add.collider(this.ball, this.paddle, this.fnBallHitPaddle, null, this);

        this.scoreText = this.add.text(5, 5, 'Score: 0', { font: '18px Arial', fill: '#0095DD' });
        this.livesText = this.add.text(this.scale.width - 5, 5, 'Lives: ' + this.lives, { font: '18px Arial', fill: '#0095DD' }).setOrigin(1, 0);
        this.lifeLostText = this.add.text(this.scale.width * 0.5, this.scale.height * 0.5, 'Life lost, click to continue', { font: '18px Arial', fill: '#0095DD' }).setOrigin(0.5, 0.5);
        this.lifeLostText.visible = false;

        this.createStartButton();
    }

    createStartButton() {
        this.startButton = this.add.sprite(this.scale.width * 0.5, this.scale.height * 0.5, 'button').setInteractive();
        this.startButton.setOrigin(0.5, 0.5);

        this.startButton.on('pointerover', () => {
            this.startButton.setFrame(1);
        });

        this.startButton.on('pointerout', () => {
            this.startButton.setFrame(0);
        });

        this.startButton.on('pointerdown', () => {
            this.startButton.setFrame(2);
            this.startButton.destroy();
            this.ball.body.velocity.set(200, -200);
            this.playing = true;
            this.ball.body.allowGravity = true;

            this.time.addEvent({
                delay: 1000,
                callback: this.spawnBrick,
                callbackScope: this,
                loop: true
            });
        });
    }

    update() {
        if (this.playing) {
            this.paddle.x = this.input.activePointer.x || this.scale.width * 0.5;
        }
    }

    spawnBrick() {
        if (!this.bricks) {
            this.bricks = this.physics.add.group({
                allowGravity: true,
                immovable: true,
                gravityY: 50
            });
        }

        const brickTypes = [
            { key: 'brick1', score: 10 },
            { key: 'brick2', score: 20 },
            { key: 'brick3', score: 30 },
            { key: 'brick4', score: 40 },
            { key: 'brick5', score: 50 }
        ];

        const selectedBrick = Phaser.Math.RND.pick(brickTypes);
        const brickX = Phaser.Math.Between(50, this.scale.width - 50);
        const brickY = 0;

        const brick = this.bricks.create(brickX, brickY, selectedBrick.key).setOrigin(0.5);
        brick.scoreValue = selectedBrick.score;

        this.physics.add.collider(this.ball, brick, this.fnBallHitBrick, null, this);
    }

    fnBallHitBrick(ball, brick) {
        brick.destroy();
        this.ball.anims.play('wobble');
        this.score += brick.scoreValue;
        this.scoreText.setText('Score: ' + this.score);

        const currentVelocityX = this.ball.body.velocity.x;
        const currentVelocityY = this.ball.body.velocity.y;
        const newVelocityX = currentVelocityX * 1.00;
        const newVelocityY = currentVelocityY * 1.00;
        this.ball.body.velocity.set(newVelocityX, newVelocityY);
    }

    fnBallLeaveScreen() {
        this.lives--;
        if (this.lives > 0) {
            this.livesText.setText('Lives: ' + this.lives);
            this.lifeLostText.visible = true;
            this.ball.setPosition(this.scale.width * 0.5, this.scale.height - 25);
            this.paddle.setPosition(this.scale.width * 0.5, this.scale.height - 5);
            this.ball.body.velocity.set(0);
            this.playing = false;
            this.input.once('pointerdown', () => {
                this.lifeLostText.visible = false;
                this.ball.body.velocity.set(200, -200);
                this.playing = true;
            });
        } else {
            this.gameOver();
        }
    }

    gameOver() {
        if (this.score > this.highScore) {
            this.highScore = this.score;
            localStorage.setItem('highScore', this.highScore); // 새로운 최고 기록 저장
        }

        // AJAX 요청을 통해 서버에 데이터 전송
        var xhr = new XMLHttpRequest();
        var params = new URLSearchParams({
            action: 'save',
            userSeq: 1, // 예시로 userSeq 전달
            gameSeq: 4, // 예시로 gameSeq 전달
            gameScore: this.score,
            gameRank: this.gameRank,
            userId: this.userId // 세션에서 가져온 userId 사용
        }).toString();
        
        xhr.open("GET", `/games/gamesServlet.games?${params}`, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                console.log("Game score saved successfully!");
            }
        };
        xhr.send();

        this.scene.start('gameOver04', { score: this.score, highScore: this.highScore });
    }
}