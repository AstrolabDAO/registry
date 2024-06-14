import os
from pathlib import Path
import types
import requests

index, cdn = "index_tpl.html", "https://cdn.astrolab.fi"
deps = ["web_indexer"]
code = [requests.get(f"{cdn}/libs/{d}.py").text for d in deps]

with open(index, "w") as f:
  f.write(requests.get(f"{cdn}/libs/{index}").text)

def save_code_as_module(code, name):
  mod = types.ModuleType(name) # new module
  exec(code, mod.__dict__) # load code into it
  mod.__dict__.update({ "__name__": name, "__file__": __file__ }) # inject context
  globals()[name] = mod # expose it

mods = {d: save_code_as_module(c, d) for d, c in zip(deps, code)}

if __name__ == "__main__":
  indexed = web_indexer.generate_index_files(Path.cwd())
  os.remove(index)
