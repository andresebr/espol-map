package
{
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	public class CustomPanZoomContent extends PanZoomContent
	{
		/**
		 * You can make your own special extension of PanZoomContent to fit your particular needs
		 * 
		 */
		public function CustomPanZoomContent()
		{
			super();
			this.width = 1920;
			this.height = 1080;
			this.backgroundColor = 0xF2EFDC;
			this.backgroundAlpha = 1;
			this.borderColor = 0x000000;
			this.borderThickness = 10;
			this.borderAlpha = 0.4;
		}
		
		override protected function _onCreationComplete(event:FlexEvent):void
		{
			super._onCreationComplete(event);
			this.addEventListener(MouseEvent.MOUSE_DOWN, this._onMouseDown); 
		}
		
		override protected function _drawContent(isRedraw:Boolean = true):void
		{
			super._drawContent(isRedraw);
			this._drawPanZoomContentGrid();
		}
		
		protected function _onMouseDown(event:MouseEvent):void
		{
			trace("Mouse down on content");
		}
		
		protected function _drawPanZoomContentGrid():void 
		{
			
			var xAt:int = 0;
			var yAt:int = 0;
			
			this.graphics.lineStyle(0.5, 0x000000, 0.2);
			
			// draw the vertical lines
			while (xAt <= this.widthAsSet) 
			{
				this.graphics.moveTo(xAt, 0);
				this.graphics.lineTo(xAt, this.heightAsSet);
				xAt = xAt + 20;
			}
			
			// draw the horizontal lines
			while (yAt <= this.heightAsSet) 
			{
				this.graphics.moveTo(0, yAt);
				this.graphics.lineTo(this.widthAsSet, yAt);
				yAt = yAt + 20;
			}
			
		}
		
	}
}