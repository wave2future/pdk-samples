/* Copyright 2010 Palm, Inc.  All rights reserved. */

var ShapespinAssistant = Class.create(
{

  	setup: function() 
	{
		/* listen for activate/deactivate to forward to spinner plugin */
		this.stageDocument = this.controller.stageController.document;
		Mojo.Event.listen(this.stageDocument, Mojo.Event.stageActivate, this.handleStageActivate);
		Mojo.Event.listen(this.stageDocument, Mojo.Event.stageDeactivate, this.handleStageDeactivate);

		this.controller.setupWidget("sliderId", 
					    this.attributes = { 'minValue': 0,
								'maxValue': 100,
								'value': 10, 
								'updateInterval': 0.1 
							      });
		Mojo.Event.listen($("sliderId"), Mojo.Event.propertyChange, this.handleSlider);
  	},

	handleSlider: function(event)
	{
		$('shapeSpinnerPlugin').setRotationSpeed(event.value);
	},

	handleStageActivate: function(event)
	{
		$('shapeSpinnerPlugin').resume();
	},
	
	handleStageDeactivate: function(event)
	{
		$('shapeSpinnerPlugin').pause();
	},
});


