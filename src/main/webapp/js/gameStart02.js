class gameStart02 extends Phaser.Scene {

    constructor(){
        super({key:"gameStart02"});
    }

    preload(){
        this.load.image('gamestartbackground', '/image/gamestartbackground.png');
    }

    create(){


        this.cameras.main.setBackgroundColor("ffffff");

        this.background = this.add.sprite(this.cameras.main.width / 2, this.cameras.main.height / 2, 'gamestartbackground');
        this.background.setOrigin(0.5, 0.5);
        this.background.displayWidth = this.cameras.main.width;
        this.background.displayHeight = this.cameras.main.height;
               


        let restartButton = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 200, "Start",{
            fontSize: '48px', 
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