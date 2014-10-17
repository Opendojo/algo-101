// Generated by CoffeeScript 1.8.0
var Histo, histogram;

histogram = (function() {
  function histogram() {
    this.init();
    this.initSVG();
  }

  histogram.prototype.init = function() {
    var i;
    this.data = (function() {
      var _i, _results;
      _results = [];
      for (i = _i = 0; _i <= 100; i = ++_i) {
        _results.push(Math.floor(Math.random() * 100));
      }
      return _results;
    })();
    console.log(this.data);
  };

  histogram.prototype.initSVG = function() {
    var bar, barHeight, chart, width, x;
    width = 420;
    barHeight = 5;
    x = d3.scale.linear().domain([0, d3.max(this.data)]).range([0, width]);
    chart = d3.select("body").append("svg").attr("width", width).attr("height", barHeight * this.data.length);
    bar = chart.selectAll("g").data(this.data).enter().append("g").attr("transform", function(d, i) {
      return "translate(0," + i * barHeight + ")";
    });
    bar.append("rect").attr("width", x).attr("height", barHeight - 1);
    bar.append("text").attr("x", function(d) {
      return x(d) + 5;
    }).attr("y", barHeight / 2).attr("dy", ".35em").text(function(d) {
      return d;
    });
  };

  histogram.prototype.render = function() {
    var bar;
    return bar = svg.selectAll(".bar").data(this.data);
  };

  histogram.prototype.getData = function() {
    return this.data;
  };

  histogram.prototype.setData = function(data) {
    this.data = data;
    return this;
  };

  return histogram;

})();

Histo = new histogram();

console.log(Histo.getData());

//# sourceMappingURL=histogram.js.map
