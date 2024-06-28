class gameOver04 extends Phaser.Scene {
    constructor() {
        super({ key: 'gameOver04' });
    }

    init(data) {
        this.score = data.score;
        this.highScore = data.highScore;
    }

    preload() {
        this.load.image('background', '/image/9.png');
    }

    create() {
        this.add.image(this.cameras.main.width / 2, this.cameras.main.height / 2, 'background')
            .setOrigin(0.5)
            .setDisplaySize(this.sys.game.config.width, this.sys.game.config.height);

        let textStyle = {
            fontSize: '48px',
            fill: '#050099',
            fontStyle: 'bold',
            stroke: '#000000',
            strokeThickness: 3,           
        };

        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 100, 'Game Over', textStyle).setOrigin(0.5);

        textStyle.fontSize = '32px';
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2, `Score: ${this.score}`, textStyle).setOrigin(0.5);
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 50, `High Score: ${this.highScore}`, textStyle).setOrigin(0.5);


         this.input.on('pointerdown', () => {
            this.scene.start('game04');
        });
    }
}