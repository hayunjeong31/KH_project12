class gameOver03 extends Phaser.Scene{

    constructor(){
        super({key:"gameOver03"});
    }
    init(data) {
        this.score = data.timer;
        this.highScore = data.highScore;
    }


    preload(){
        this.load.image('back', 'night.jpg'); // 배경 이미지 경로

    }

    create(){
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
        
        let timer = this.data.get('timer');
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2, `Score: ${timer}`, textStyle).setOrigin(0.5);
       // this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 50, `High Score: ${this.highScore}`, textStyle).setOrigin(0.5);

       
        let restartButton = this.add.text(this.cameras.main.width /2, this.cameras.main.height / 2 +100,"Restart",{
            fontSize:"35px",
            fill:"#e2ce5d",
            // fontSize: '48px', 
            // fill: '#FF0000', 
            fontStyle: 'bold', 
            stroke: '#000000', // 테두리 색상
            strokeThickness: 6, // 테두리 두께
            shadow: { offsetX: 3, offsetY: 3, color: '#000', blur: 3, stroke: true, fill: true } // 그림자
      
        }).setOrigin(0.5).setInteractive();

        restartButton.on("pointerover", ()=>{
            this.game.canvas.style.cursor = "pointer";
        })

        restartButton.on("pointerout",()=>{
            // restartButton.setBackgroundColor("#000000");
            this.game.canvas.style.cursor = "default";
        })

        restartButton.on("pointerdown",()=>{
            this.scene.start("game03");
        })

    }

    update(){

    }

}