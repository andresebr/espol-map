package classes
{
	public class Watch
	{
		import flash.display.Sprite;
		import flash.events.TimerEvent;
		import flash.utils.Timer;
		
		var minuteTimer:Timer;
		
		public function Watch()
		{
			minuteTimer = new Timer(1000, 2);
		}
		
		//Timer--------------------------------------------------------------------------------------------------------
		public function shortTimer():void 
		{
			// creates a new five-second Timer
			//var minuteTimer:Timer = new Timer(1000, 2);
			
			// designates listeners for the interval and completion events
			minuteTimer.addEventListener(TimerEvent.TIMER, onTick);
			minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			
			// starts the timer ticking
			minuteTimer.start();
		}
		
		public function onTick(event:TimerEvent):void 
		{
			// displays the tick count so far
			// The target of this event is the Timer instance itself.
			trace("tick " + event.target.currentCount);
		}
		
		public function onTimerComplete(event:TimerEvent):void
		{
			trace("Time's Up!");
			//faceRecognition.train();
		}
	}
}