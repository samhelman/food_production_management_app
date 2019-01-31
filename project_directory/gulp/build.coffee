g = module.parent.exports

g.task "build", ["clean"], -> g.start "fonts", "images","videos","scripts", "css", "vendor" , "framecss"
