import pandas as pd

from IPython.display import display

predaje = pd.read_csv("predaje.csv")

predaje = pd.DataFrame(predaje)
print(predaje)

print("----------------------------------")
print("Pivot table I")
print("----------------------------------")

pivot1 = pd.pivot_table(predaje, index=["produkt"],
                        values=["cena"], columns=["krajina"])
print(pivot1)

print("----------------------------------")
print("Pivot table II")
print("----------------------------------")

pivot2 = pd.pivot_table(predaje, index=["kluc"], values=["cena"],
                     columns=["krajina", "produkt"], observed=True)
print(pivot2)

print("----------------------------------")
print("Pivot table III")
print("----------------------------------")
pivot3 = pd.pivot_table(predaje, index=["cas_nakupu"], values=["X"],
                        columns=["krajina", "kategoria", "kluc"], aggfunc=len)
print(pivot3)

