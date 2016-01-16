class Dashing.PieChart extends Dashing.Widget

  ready: ->
    # Margins: zero if not set or the same as the opposite margin
    # (you likely want this to keep the chart centered within the widget)
    left = @get('leftMargin') || 0
    right = if @get('rightMargin')? then @get('rightMargin') else left
    top = @get('topMargin') || 0
    bottom = if @get('bottomMargin')? then @get('bottomMargin') else top

    container = $(@node).parent()
    # Gross hacks. Let's fix this.
    width = (Dashing.widget_base_dimensions[0] * container.data("sizex")) + Dashing.widget_margins[0] * 2 * (container.data("sizex") - 1) - left - right
    height = (Dashing.widget_base_dimensions[1] * container.data("sizey")) - 35 - top - bottom

    # Lower the chart's height to make space for moreinfo if not empty
    if !!@get('moreinfo')
      height -= 20

    $holder = $("<div class='canvas-holder' style='left:#{left}px; top:#{top}px; position:absolute;'></div>")
    $(@node).append $holder

    canvas = $(@node).find('.canvas-holder')
    canvas.append("<canvas width=\"#{width}\" height=\"#{height}\" class=\"chart-area\"/>")

    @ctx = $(@node).find('.chart-area')[0].getContext('2d')
    @myData = @get('segments')

    @myChart = new Chart(@ctx).Pie(@myData, $.extend({
      responsive: true
      segmentShowStroke: true
    }, @get('options')))

  onData: (data) ->
    # Load new values, ie,
    #   @myChart.segments[0].value = data.segments[0].value
    #   @myChart.segments[1].value = data.segments[1].value
    #   ...
    if @myChart && data.segments
      for i in [0..@myChart.segments.length - 1]
        @myChart.segments[i].value = data.segments[i].value

      @myChart.update()
