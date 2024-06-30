class gameOver01 extends Phaser.Scene {
    constructor() {
        super({ key: 'gameOver01' });
    }

    init(data) {
        this.score = data.score;
        this.highScore = data.highScore;
    }

    preload() {
        this.load.image('back', '/image/마리오2.jpg'); // 배경 이미지 경로
    }

    create() {
        this.background = this.add.sprite(this.cameras.main.width / 2, this.cameras.main.height / 2, 'back');
        this.background.setOrigin(0.5, 0.5);
        this.background.displayWidth = this.cameras.main.width;
        this.background.displayHeight = this.cameras.main.height;

        // 두껍게, 잘 보이게 설정
        let textStyle = { 
            fontSize: '48px', 
            fill: '#FF0000', 
            fontStyle: 'bold', 
            stroke: '#000000', // 테두리 색상
            strokeThickness: 6, // 테두리 두께
            shadow: { offsetX: 3, offsetY: 3, color: '#000', blur: 3, stroke: true, fill: true } // 그림자
        };

        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 100, 'Game Over', textStyle).setOrigin(0.5);

        textStyle.fontSize = '32px';
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2, `Score: ${this.score}`, textStyle).setOrigin(0.5);
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 50, `High Score: ${this.highScore}`, textStyle).setOrigin(0.5);

        this.input.on('pointerdown', () => {
            this.scene.start('game01');
        });
    }
}