class histogram

    constructor:()->
        @init()
        @render()

    init:()->
        @width = 420
        @barHeight = 5
        @data = for i in [0..100]
                    Math.floor(Math.random()*100)
        console.log @data
        @chart = d3.select("body").append("svg")
            .attr("width", @width)
            .attr("height", @barHeight * @data.length)
        return

    render:()->
        x = d3.scale.linear()
            .domain([0, d3.max(@data)])
            .range([0, @width])

        bar = @chart.selectAll("g")
            .data(@data)
        
        bar.attr('class','update')

        bar.enter().append("g")
            .attr("class","enter")
            .attr("transform", (d, i)=> return "translate(0," + i * @barHeight + ")"; )

        bar.append("rect")
            .attr("width", x)
            .attr("height", @barHeight - 1)

        bar.append("text")
            .attr("x", (d)-> return x(d) + 5 )
            .attr("y", @barHeight / 2)
            .attr("dy", ".35em")
            .text( (d)-> return d );

        bar.exit().remove()

        return

    getData:()->
        return @data

    setData:(@data)->
        return @

Histo = new histogram()
console.log(Histo.getData())
window.histo = Histo