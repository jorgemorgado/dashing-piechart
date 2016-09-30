source = 'http://some.remote.host/piechart.xml'

labels = ['Jan', 'Feb', 'Mar']

SCHEDULER.every '10s', :first_in => 0 do |job|

  data = [
    {
      # Create a random set of data for the chart
      data: Array.new(3) { rand(30) },
      backgroundColor: [
        '#F7464A',
        '#46BFBD',
        '#FDB45C',
      ],
      hoverBackgroundColor: [
        '#FF6384',
        '#36A2EB',
        '#FFCE56',
      ],
    },
  ]

  send_event('piechart', { labels: labels, datasets: data })
end
