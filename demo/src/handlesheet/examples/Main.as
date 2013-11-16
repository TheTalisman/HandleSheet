package handlesheet.examples 
{
	import flash.geom.Point;
	
	import lambmei.starling.display.HandleSheet;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	

	public class Main extends Sprite
	{
		/**
		 * Constructor.
		 */
		
		[Embed(source="/../assets/images/atlas.png")]
		private static const ICONS_IMAGE:Class;
		
		[Embed(source="/../assets/images/atlas.xml",mimeType="application/octet-stream")]
		private static const ICONS_XML:Class;
		
		
		private var _textureAtlas:TextureAtlas
		
		
		private var lastSelect:HandleSheet
		
		public function Main()
		{
			
			_textureAtlas = new TextureAtlas(Texture.fromBitmap(new ICONS_IMAGE(), false), XML(new ICONS_XML()));
			
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		
		/**
		 * Where the magic happens. Start after the main class has been added
		 * to the stage so that we can access the stage property.
		 */
		protected function addedToStageHandler(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			
			
			
			
			
			var texture:Texture = _textureAtlas.getTexture("facebook")
			
			var img:Image =new Image(texture)
			
			
			var btnTexture:Texture = _textureAtlas.getTexture("normal-page-symbol");
			
			
			//Item
			var hs:HandleSheet = new HandleSheet(img)
			hs.setCtrlButtonInitByTexture(btnTexture)
			hs.addEventListener(HandleSheet.EVENT_SELECTED, onTouch);
			hs.x = 300
			hs.y = 300
			
			addChild(hs)
			
			img = new Image(_textureAtlas.getTexture("selected-page-symbol"))
			img.width = 20
			img.height = 20
				
			
			hs = new HandleSheet(new Image(_textureAtlas.getTexture("MuttonHotPot")))
			hs.setCtrlButtonInitByObject(img)
			hs.addEventListener(HandleSheet.EVENT_SELECTED, onTouch);
			hs.maxSize = 2
			hs.x = 100
			hs.y = 150
				
			addChild(hs)
				
			hs = new HandleSheet(new Image(_textureAtlas.getTexture("lamb-mei")))
			hs.setCtrlButtonInitByObject(new Image(_textureAtlas.getTexture("selected-page-symbol")))
			hs.addEventListener(HandleSheet.EVENT_SELECTED, onTouch);
			hs.x = 100
			hs.y = 250
				
			addChild(hs)	
				
				
			hs = new HandleSheet(new Image(_textureAtlas.getTexture("yahoo")))
			hs.setCtrlButtonInitByTexture(_textureAtlas.getTexture("CtrlButton/0000"),
				_textureAtlas.getTexture("CtrlButton/0001"))
			hs.addEventListener(HandleSheet.EVENT_SELECTED, onTouch);
			
			hs.x = 300
			hs.y = 450
			
			
			addChild(hs)
			
			addEventListener(HandleSheet.EVENT_SELECTED, onTouch);
		}
		
		protected function onTouch(event:Event):void
		{
//			trace(event.target)
//			trace(event.target is HandleSheet)
			if(event.target is HandleSheet){
				
				if(lastSelect!=null && event.target != lastSelect){
					lastSelect.selected = false
				}
				
				
				lastSelect = event.target as HandleSheet
			}
		}
	}
}
