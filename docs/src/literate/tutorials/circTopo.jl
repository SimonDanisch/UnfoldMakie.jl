# # Circular Topoplot Arrangement


using UnfoldMakie
using CairoMakie
using TopoPlots # for example data
using Random
using DataFrames



# # Generate data
# Generate a Dataframe. We need to specify the TopoPlot Positions either via position, or via labels (according to TopoPlots.jl)
data,pos = TopoPlots.example_data();
dat = data[:, 240, 1]
df= DataFrame(
    :estimate=>eachcol(Float64.(data[:,100:40:300,1])),
    :circularVariable=>[0,50,80,120,180,210],
    :time=>100:40:300)
df = flatten(df,:estimate);

# # Our first plot!
# note how the plots are at the angles of circularVariable`
plot_circulareegtopoplot(df;positions=pos,axis=(;label="Sac Incoming"),predictor=:circularVariable)


# In case the bounding variable is not between 0 and 360, as here we use actually time, we have to specify it. e.g.
plot_circulareegtopoplot(df;positions=pos,axis=(;label="Time?!"),predictor=:time,extra=(;predictorBounds=[80,320]))
