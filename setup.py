from pathlib import Path
import types
import requests

index, cdn, deps = "index_tpl.html", "https://cdn.astrolab.fi", ["web_indexer"]

def get_as_utf8(url):
  r = requests.get(url); r.encoding = "utf-8"
  return r.text

def save_code_as_module(name):
  mod = types.ModuleType(name) # new module
  mod.__dict__.update({ "__name__": name, "__file__": __file__ }) # inject context
  exec(get_as_utf8(f"{cdn}/libs/{name}.py"), mod.__dict__) # load code into it
  globals()[name] = mod # expose it
  return mod

mods = {d: save_code_as_module(d) for d in deps}

if __name__ == "__main__":
  indexed = web_indexer.generate_index_files(root=Path.cwd(), git_root="", template_path=f"{cdn}/libs/{index}") # type: ignore
