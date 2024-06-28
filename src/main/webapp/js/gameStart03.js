class gameStart03 extends Phaser.Scene {
    constructor() {
        super({ key: 'gameStart03' });
        
    }

    preload() {
        // 필요한 리소스 로드
        this.load.image('back', '../image/desert.png'); // 배경이미지
    }

    create() {
        this.background = this.add.sprite(this.cameras.main.width / 2, this.cameras.main.height / 2, 'back');
        this.background.setOrigin(0.5, 0.5);
        this.background.displayWidth = this.cameras.main.width;
        this.background.displayHeight = this.cameras.main.height;
        
       
        // 화면 중앙에 텍스트 추가
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 100, 'shoot Enemies', {
            fontSize: '48px',
            fill: '#ffffff',
            fontSize: '48px', 
            fill: '#FF0000', 
            fontStyle: 'bold', 
            stroke: '#000000', // 테두리 색상
            strokeThickness: 6, // 테두리 두께
            shadow: { offsetX: 3, offsetY: 3, color: '#000', blur: 3, stroke: true, fill: true } // 그림자
      
        }).setOrigin(0.5);

        // 시작 버튼 추가
        let startButton = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 200, 'startButton', {
            fontSize: "35px",
            fill: "#e2ce5d",
            fontStyle: 'bold', 
            stroke: '#000000', 
            strokeThickness: 6, 
            shadow: { offsetX: 3, offsetY: 3, color: '#000', blur: 3, stroke: true, fill: true }
    }).setOrigin(0.5).setInteractive();

    startButton.on("pointerover", () => {
        this.game.canvas.style.cursor = "pointer";
    });

    startButton.on("pointerout", () => {
        this.game.canvas.style.cursor = "default";
    });

    startButton.on("pointerdown", () => {
        this.scene.start("game03");
    });

    
    }
}
