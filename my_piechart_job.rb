source = 'http://some.remote.host/piechart.xml'

labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July']

SCHEDULER.every '10s', :first_in => 0 do |job|

  # Create a random set of data for the chart
  data = Array.new(5) { rand(30) }

  send_event('piechart', {
    segments: [
      {
        value: data[0],
        color: '#F7464A',
        highlight: '#FF5A5E',
        label: 'January',
      }, {
        value: data[1],
        color: '#46BFBD',
        highlight: '#5AD3D1',
        label: 'February',
      }, {
        value: data[2],
        color: '#FDB45C',
        highlight: '#FFC870',
        label: 'March',
      }, {
        value: data[3],
        color: '#949FB1',
        highlight: '#A8B3C5',
        label: 'April',
      }, {
        value: data[4],
        color: '#4D5360',
        highlight: '#4D5360',
        label: 'April',
      }
    ]
  })
end
