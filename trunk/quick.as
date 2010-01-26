﻿package {	import flash.display.MovieClip	import flash.display.DisplayObject	import flash.events.MouseEvent	import flash.events.Event	public class quick extends MovieClip{		private var _self:quickSelection = new quickSelection(this)		public function add(ref:*):quick{			if(ref is DisplayObject){				this.addChild(ref);			}else if(ref is Array){				for each( var c:DisplayObject in ref as Array){					this.addChild(c)				}			}			return this;		}				public function remove(ref:*):quick{			if(ref is DisplayObject){				this.removeChild(ref);			}else if(ref is Array){				for each( var c:DisplayObject in ref as Array){					this.removeChild(c)				}			}			return this;		}		public function select(cl:Class):Array{			var ret:quickSelection = new quickSelection();			for( var a:int=0;a<this.numChildren;a++){				if( this.getChildAt(a) is cl ) ret.push( this.getChildAt(a) );			}			return ret;		}				public function click(fn:Function):quick{			_self.click(fn)			return this;		}				public function over(fn:Function):quick{			_self.over(fn)			return this;		}				public function out(fn:Function):quick{			_self.out(fn)			return this;		}		public function down(fn:Function):quick{			_self.down(fn)			return this;		}		public function up(fn:Function):quick{			_self.up(fn)			return this;		}				public function show():quick{			_self.show()			return this;		}		public function hide():quick{			_self.hide()			return this;		}		public function toggle():quick{			_self.toggle()			return this;		}		public function exec(fn:Function):quick{			_self.exec(fn);			return this;		}				public function enterFrame(fn:Function):quick{			_self.enterFrame(fn)			return this;		}					}}import flash.display.DisplayObjectimport flash.events.MouseEventimport flash.events.Eventdynamic class quickSelection extends Array{	function quickSelection(...args:Array){		super.push.apply(null, args)	}		public function listen(to:String, fn:Function):quickSelection{		for each( var c:DisplayObject in this)			c.addEventListener(to, function(){ fn.apply(c,null) }, false, 1, true)		return this	}		public function exec(fn:Function):quickSelection{		for each( var c:DisplayObject in this)			fn.apply( c, null);		return this	}		public function select(cl:Class):quickSelection{		var ret:quickSelection = new quickSelection();		for each( var c:DisplayObject in this)			if( c is cl ) ret.push(c)		return ret;	}		public function not(ref:*):quickSelection{		var a:int = 0;		if(ref is DisplayObject){			for(;a<this.length;a++){				if( this[a] === ref){					this.splice(a,1);					break;				}			}					}else if(ref is Class){			for(;a<this.length;a++){				if( this[a] is ref){					this.splice(a,1);					a--				}			}					}		return this;	}		public function toString(){		var ret:String = "[quickSelection]\n";		for each(var c:DisplayObject in this){			ret += "\t" + c + "\n"		}		return ret;	}		/**** WRAPPERS ****/	public function hide():quickSelection{		return exec(function(){this.visible = false})	}	public function show():quickSelection{		return exec(function(){this.visible = true})	}	public function toggle():quickSelection{		return exec(function(){this.visible =! this.visible})	}	public function alpha(a:Number):quickSelection{		return exec(function(){this.alpha = a })	}	public function rotation(r:Number):quickSelection{		return exec(function(){this.rotation = r })	}	public function down(fn:Function):quickSelection{		return listen(MouseEvent.MOUSE_DOWN,fn)	}	public function up(fn:Function):quickSelection{		return listen(MouseEvent.MOUSE_UP,fn)	}	public function click(fn:Function):quickSelection{		return listen(MouseEvent.CLICK,fn)	}	public function over(fn:Function):quickSelection{		return listen(MouseEvent.MOUSE_OVER,fn)	}	public function out(fn:Function):quickSelection{		return listen(MouseEvent.MOUSE_OUT,fn)	}	public function enterFrame(fn:Function):quickSelection{		return listen(Event.ENTER_FRAME,fn)	}}