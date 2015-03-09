# functions to test the julia/PUMI interface

@doc """
  declareNames() declares global constant variables that are used to construct
  the first argument to the ccall function (it must be a constant expression)

  names declared in C++ code as 'extern "C" ' will not be mangled, but some
  libraries do not do this, so these variables can be used to declare a human
  readable variable name for the mangled name
"""

function declareNames()
# declare variables that hold the (possible mangled) names of c++ library functions
global const pumi_libname = "libfuncs1"
global const init_name = "initABC"
global const resetVertIt_name = "resetVertIt"
global const resetEdgeIt_name = "resetEdgeIt"
global const resetFaceIt_name = "resetFaceIt"
global const resetElIt_name  = "resetElIt"
global const incrementVertIt_name = "incrementVertIt"
global const incrementVertItn_name = "incrementVertItn"

global const incrementEdgeIt_name = "incrementEdgeIt"
global const incrementEdgeItn_name = "incrementEdgeItn"

global const incrementFaceIt_name = "incrementFaceIt"
global const incrementFaceItn_name = "incrementFaceItn"

global const incrementElIt_name = "incrementElIt"
global const incrementElItn_name = "incrementElItn"

global const setGlobalVertNumber_name = "setGlobalVertNumber"
global const getGlobalVertNumber_name = "getGlobalVertNumber"
global const getVertNumber_name = "getVertNumber"
global const getEdgeNumber_name = "getEdgeNumber"
global const getFaceNumber_name = "getFaceNumber"
global const getElNumber_name = "getElNumber"
global const getVert_name = "getVert"
global const getEdge_name = "getEdge"
global const getFace_name = "getFace"
global const getEl_name = "getEl"
global const getVertNumber2_name = "getVertNumber2"
global const getEdgeNumber2_name = "getEdgeNumber2"
global const getFaceNumber2_name = "getFaceNumber2"
global const getElNumber2_name = "getElNumber2"


global const checkVars_name = "checkVars"
global const checkNums_name = "checkNums"
global const getVertCoords_name = "getVertCoords"
global const getEdgeCoords_name = "getEdgeCoords"
global const getFaceCoords_name = "getFaceCoords"
global const getElCoords_name = "getElCoords"

end


@doc """
  initilize the state of the interface library

  Naming conventions: mesh entity type 0 = vertex, 1 = edge, 2 = face, 3 = element

  Output variables:
    * downward_counts: returns the number of downward adjacencies of the first
                       element (useful if all elements are the same)
		       downward_counts[i,j] gives the number of downward
		       adjacenies entity type i has of type j
		       upward adjacencies ( i >= j) are not likely to be the
		       same for different elements, so they are set to zero
    * num_Entities : returns column vector containing number of entities of
                       each type in the mesh
"""

function init()
# initilize mesh interface

downward_counts = zeros(Int32, 4,4);
num_Entities = zeros(Int32, 4, 1)
i = ccall( (init_name, pumi_libname), Int32, (Ptr{Int32},Ptr{Int32}), downward_counts, num_Entities )  # call init in interface library

if ( i != 0)
  println("init failed, exiting ...")
  exit()
end


return downward_counts, num_Entities
end


function resetVertIt()
# reset the vertex iterator to the beginning

ccall( (resetVertIt_name, pumi_libname), Void, () );
return nothing

end


function resetEdgeIt()
# reset the edge iterator to the beginning

ccall( (resetEdgeIt_name, pumi_libname), Void, () );
return nothing

end


function resetFaceIt()
# reset the face iterator to the beginning

ccall( (resetFaceIt_name, pumi_libname), Void, () );
return nothing

end


function resetElIt()
# reset the element iterator to the beginning

ccall( (resetElIt_name, pumi_libname), Void, () );
return nothing

end

function incrementVertIt()
# increment it vertex iterator

ccall( (incrementVertIt_name, pumi_libname), Void, () );
return nothing

end


function incrementVertItn(n::Integer)
# increment it vertex iterator

ccall( (incrementVertItn_name, pumi_libname), Void, (Int32,), n );
return nothing

end




function incrementEdgeIt()
# increment it edge iterator

ccall( (incrementEdgeIt_name, pumi_libname), Void, () );
return nothing

end

function incrementEdgeItn(n::Integer)
# increment it vertex iterator

ccall( (incrementEdgeItn_name, pumi_libname), Void, (Int32,), n );
return nothing

end




function incrementFaceIt()
# increment it Face iterator

ccall( (incrementFaceIt_name, pumi_libname), Void, () );
return nothing

end

function incrementFaceItn(n::Integer)
# increment it face iterator n times

ccall( (incrementFaceItn_name, pumi_libname), Void, (Int32,), n );
return nothing

end




function incrementElIt()
# increment it element iterator

ccall( (incrementElIt_name, pumi_libname), Void, () );
return nothing

end

function incrementElItn(n::Integer)
# increment it element iterator

ccall( (incrementElItn_name, pumi_libname), Void, (Int32,), n );
return nothing

end




function setGlobalVertNumber(val::Integer)
# set global Vertex number of the current node

ccall( (setGlobalVertNumber_name, pumi_libname), Void, (Int32,), val)
return nothing

end

function getGlobalVertNumber()
# get global vertex number of the current

i = ccall( (getGlobalVertNumber_name, pumi_libname), Int32, () )
return i

end


function getVertNumber()
# get the number of the current vertex
  i = ccall( (getVertNumber_name, pumi_libname), Int32, () )
  return i
end


function getEdgeNumber()
# get the number of the current edge
  i = ccall( (getEdgeNumber_name, pumi_libname), Int32, () )
  return i
end


function getFaceNumber()
# get the number of the current face
  i = ccall( (getFaceNumber_name, pumi_libname), Int32, () )
  return i
end

function getElNumber()
# get the number of the current element
  i = ccall( (getElNumber_name, pumi_libname), Int32, () )
  return i
end


function getVert()
# get pointer to current vertex
  entity = ccall( (getVert_name, pumi_libname), Ptr{Void}, () )

  return entity
end

function getEdge()
# get pointer to current Edge
  entity = ccall( (getEdge_name, pumi_libname), Ptr{Void}, () )

  return entity
end

function getFace()
# get pointer to current face
  entity = ccall( (getFace_name, pumi_libname), Ptr{Void}, () )

  return entity
end

function getEl()
# get pointer to current element
  entity = ccall( (getEl_name, pumi_libname), Ptr{Void}, () )

  return entity
end




function getVertNumber2(entity)

  i = ccall( (getVertNumber2_name, pumi_libname), Int32, (Ptr{Void},), entity)
  return i
end


function getEdgeNumber2(entity)

  i = ccall( (getEdgeNumber2_name, pumi_libname), Int32, (Ptr{Void},), entity)
  return i
end


function getFaceNumber2(entity)

  i = ccall( (getFaceNumber2_name, pumi_libname), Int32, (Ptr{Void},), entity)
  return i
end


function getElNumber2(entity)

  i = ccall( (getElNumber2_name, pumi_libname), Int32, (Ptr{Void},), entity)
  return i
end


function checkVars()
ccall ( (checkVars_name, pumi_libname), Void, () );

return nothing
end


function checkNums()
ccall( (checkNums_name, pumi_libname), Void, () )

end

function getVertCoords(coords::Array{Float64, 2}, m::Int, n::Int)
# coords is array to put coordsinates in, must be 3 by 1,
# m, n are number of rows, columns in coords, respectively

#coords = Array(Float64, 3, 2)   # pass an array 3 by n (3 coordinates each for n points)
#(m,n) = size(coords)
# pass reversed m,n because C arrays are row-major
ccall( (getVertCoords_name, pumi_libname), Void, (Ptr{Float64}, Int, Int), coords, n, m) 

println("\n from julia, coords = ", coords)

return coords
end

function getEdgeCoords(coords::Array{Float64, 2}, m::Int, n::Int)
# coords is array to put coordinates in, must be 3 by 2
# m,n = number of rows, columns in coords, respectively

i = ccall( (getEdgeCoords_name, pumi_libname), Int, (Ptr{Float64}, Int, Int), coords, n, m);

if ( i != 0)
  println("Error in getEdgeCoords... exiting")
  exit()
end

println("in julia, coords = ", coords)

end

function getFaceCoords(coords::Array{Float64, 2}, m::Int, n::Int)
# get coordinates of points on a face, in order
# coords is array to populate with coordinates, must by 3 by number of points
# on a face
# m,n = number of rows, columns in coords, respectively

# reverse m and n because C is row major
i = ccall( (getFaceCoords_name, pumi_libname), Int, (Ptr{Float64}, Int, Int), coords, n, m);

if ( i != 0)
  println("Error in getEdgeCoords... exiting")
  exit()
end

println("in julia, coords = ", coords)

end

function getElCoords(coords::Array{Float64, 2}, m::Integer, n::Integer)
# get coordinates of points in an element, in order
# coords is array to populate with coordinates, must by 3 by number of points
# on a element
# m,n = number of rows, columns in coords, respectively

# reverse m and n because C is row major
i = ccall( (getElCoords_name, pumi_libname), Int, (Ptr{Float64}, Int32, Int32), coords, n, m);

if ( i != 0)
  println("Error in getEdgeCoords... exiting")
  exit()
end

println("in julia, coords = ", coords)

end
