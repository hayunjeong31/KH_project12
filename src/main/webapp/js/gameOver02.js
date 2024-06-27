class gameOver02 extends Phaser.Scene {

    constructor(){
        super({key:"gameOver02"});
    }

    preload(){
        this.load.image('gameoverbackground', '/image/gameoverbackground.png');
    }

    create(){

        this.cameras.main.setBackgroundColor("ffffff");

        this.background = this.add.tileSprite(0, 0, this.cameras.main.width, this.cameras.main.height, 'gameoverbackground');
        this.background.setOrigin(0, 0);

        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 4, "Game Over!!", {
            fontSize: '54px', 
            fill: '#FF0000', 
            fontStyle: 'bold', 
            stroke: '#000000', // 테두리 색상
            strokeThickness: 6, // 테두리 두께
            shadow: { offsetX: 3, offsetY: 3, color: '#000', blur: 3, stroke: true, fill: true } // 그림자
        }).setOrigin(0.5); 


        // 타이머 값 표시
        let timer = this.data.get('timer');
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2, `Result: ${timer} seconds`, {
            fontSize: '52px', 
            fill: '#FF0000', 
            fontStyle: 'bold', 
            stroke: '#000000', // 테두리 색상
            strokeThickness: 6, // 테두리 두께
            shadow: { offsetX: 3, offsetY: 3, color: '#000', blur: 3, stroke: true, fill: true } // 그림자
        }).setOrigin(0.5);
   


        let restartButton = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 150, "Restart",{
            fontSize: '40px', 
            fill: '#FF0000', 
            fontStyle: 'bold', 
            stroke: '#000000', // 테두리 색상
            strokeThickness: 6, // 테두리 두께
            shadow: { offsetX: 3, offsetY: 3, color: '#000', blur: 3, stroke: true, fill: true } // 그림자
        }).setOrigin(0.5).setInteractive();

        restartButton.on("pointerdown", () => {
            this.scene.start("game02");
        })

        restartButton.on("pointerover", () => {
            this.game.canvas.style.cursor = "pointer";
        })

        restartButton.on("pointerout", () => {
            this.game.canvas.style.cursor = "default";
        });

    }

    update(){

    }

}