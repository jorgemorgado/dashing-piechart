# dashing-piechart

## Preview

![PieChart](https://raw.githubusercontent.com/wiki/jorgemorgado/dashing-piechart/piechart.png)

## Description

Simple [Dashing](http://shopify.github.com/dashing) widget (and associated job)
to render pie charts. Uses [Chart.js](http://www.chartjs.org/) library.

## Dependencies

Download `Chart.min.js` from [http://www.chartjs.org](http://www.chartjs.org)
and copy it into `assets/javascripts`.

## Usage

Add the following code on the desired dashboard:

```erb
<li data-row="1" data-col="3" data-sizex="1" data-sizey="1">
  <div data-id="piechart" data-view ="PieChart" data-title="Pie Chart" data-moreinfo="Using segmentShowStroke: true"></div>
</li>
```

Create your pie chart job `my_piechart_job.rb`:

```ruby
# Note: change this to obtain your chart data from some external source
data = [{
    value: rand(20),
    color: "#F7464A",
    highlight: "#FF5A5E",
    label: "January",
  }, {
    value: rand(30),
    color: "#46BFBD",
    highlight: "#5AD3D1",
    label: "February",
  }, {
    value: rand(30),
    color: "#FDB45C",
    highlight: "#FFC870",
    label: "March",
  }, {
    value: rand(30),
    color: "#949FB1",
    highlight: "#A8B3C5",
    label: "April",
  }, {
    value: rand(30),
    color: "#4D5360",
    highlight: "#4D5360",
    label: "April",
  }
]

send_event('piechart', { segments: data })
```

## License

This widget is released under the [MIT License](http://www.opensource.org/licenses/MIT).
