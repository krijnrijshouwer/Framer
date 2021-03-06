{BaseClass} = require "./BaseClass"
{Events} = require "./Events"

class Canvas extends BaseClass

	@define "width",  get: -> window.innerWidth
	@define "height", get: -> window.innerHeight
	@define "size", get: -> {width:@width, height:@height}
	@define "frame", get: -> {x:0, y:0, width:@width, height:@height}

	@define "backgroundColor",
		importable: false
		exportable: false
		get: -> Framer.Device.background.backgroundColor
		set: (value) -> Framer.Device.background.backgroundColor = value

	@define "image",
		importable: false
		exportable: false
		get: -> Framer.Device.background.image
		set: (value) -> Framer.Device.background.image = value

	constructor: (options={})->
		super options
		Events.wrap(window).addEventListener("resize", @_handleResize)

	onResize: (cb) -> @on("resize", cb)

	toInspect: ->
		return "<#{@constructor.name} #{@width}x#{@height}>"

	_handleResize: (event) =>
		@emit("resize")
		@emit("change:width")
		@emit("change:height")
		@emit("change:size")
		@emit("change:frame")

exports.Canvas = Canvas
