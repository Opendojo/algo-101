class histogram

    constructor:()->
        @init()
        @initSVG()

    init:()->
        @data = for i in [0..100]
                    Math.floor(Math.random()*100)
        console.log @data
        return

    initSVG:()->
        width = 420
        barHeight = 5

        x = d3.scale.linear()
            .domain([0, d3.max(@data)])
            .range([0, width])

        chart = d3.select("body").append("svg")
            .attr("width", width)
            .attr("height", barHeight * @data.length)

        bar = chart.selectAll("g")
            .data(@data)
            .enter().append("g")
            .attr("transform", (d, i)-> return "translate(0," + i * barHeight + ")"; )

        bar.append("rect")
            .attr("width", x)
            .attr("height", barHeight - 1)

        bar.append("text")
            .attr("x", (d)-> return x(d) + 5 )
            .attr("y", barHeight / 2)
            .attr("dy", ".35em")
            .text( (d)-> return d );

        return

    render:()->
        bar = svg.selectAll(".bar")
                .data(@data)

    getData:()->
        return @data

    setData:(@data)->
        return @

Histo = new histogram()
console.log(Histo.getData())
