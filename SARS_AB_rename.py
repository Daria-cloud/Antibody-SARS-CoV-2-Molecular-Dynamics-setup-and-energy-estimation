# If chain id in model_heavy.pdb != 'H', rename it to 'H'
from Bio.PDB.PDBParser import PDBParser
from Bio.PDB import PDBIO
parser = PDBParser()
structure = parser.get_structure('heavy', 'model_heavy.pdb')
model = structure[0]
for model in structure:
    for chain in model:
      if chain.id != 'H':
        chain.id='H'
w = PDBIO()
w.set_structure(structure)
w.save('model_heavy_renamed.pdb')
# If chain id in model_light.pdb != 'L', rename it to 'L'
structure = parser.get_structure('light', 'model_light.pdb')
model = structure[0]
for model in structure:
    for chain in model:
      if chain.id != 'L':
        chain.id='L'
w = PDBIO()
w.set_structure(structure)
w.save('model_light_renamed.pdb')