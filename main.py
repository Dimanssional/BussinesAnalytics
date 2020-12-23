import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
from matplotlib import patches

import numpy as np
from IPython.display import display

dfsolutions = pd.read_csv('solutions.csv')

dfsolutions = pd.DataFrame(dfsolutions)
pd.set_option("display.max_rows", None, "display.max_columns", None)
display(dfsolutions)


time = dfsolutions.time_left
print(time)

display(dfsolutions.loc[:10, ])

print(dfsolutions.info(verbose=True))


dfsolutions.dropna(inplace=True)
display(dfsolutions)

dfsolutions["subject_id"] = dfsolutions["subject_id"].astype('category')


print(dfsolutions["stop"][6])


print(dfsolutions.loc[3][5])

dfsolutions_numeric = dfsolutions._get_numeric_data()
display(dfsolutions_numeric)

print(dfsolutions_numeric.mean())


time = np.where(dfsolutions["time_left"] > 2200, True, False)
dfsolutions["time"] = time

display(dfsolutions)


dfsolutions_1 = dfsolutions.loc[lambda dfsolutions: dfsolutions["problem_id"] > 200, :]
display(dfsolutions_1)


dfsolutions_2 = dfsolutions.sort_values(by=['subject_id'])
display(dfsolutions_2)


print(dfsolutions.describe().transpose())


box = dfsolutions.boxplot(column=["time_left"],
                          by=["answer"],
                          grid=False,
                          return_type='both',
                          patch_artist=True)

colors = ["red", "red", "red", "red", "red"]

for row_key, (ax, row) in box.iteritems():
    ax.set_xlabel('')
    for i,box in enumerate(row['boxes']):
        box.set_facecolor(colors[i])

plt.show()


hstr = dfsolutions["time_left"].where(dfsolutions["subject_id"] == 23)
sns.set_style("darkgrid")
his = sns.distplot(hstr, color="green", kde=False, bins=5)
plt.axhline(y=5, color='red', lw=2, linestyle='--')
plt.show()


sns.set_style("darkgrid")
my_plot = sns.FacetGrid(dfsolutions, col="answer")
my_plot.map(plt.scatter, 'start', 'stop')


my_plot = sns.FacetGrid(dfsolutions, col="time")
my_plot.map(plt.scatter, 'start', 'stop')


def funkcia(c, d, n):
    f = np.arange(1, n+0.5, 0.5)

    for val in f:
        if val == c:
            val = "A"
            print(val)
        elif val == d:
            val = "B"
            print(val)
        else:
            print(val)


funkcia(2, 3, 5)


quakes_csv = pd.read_csv("quakes.csv")

quakes = pd.DataFrame(quakes_csv)
# display(quakes)
plt.figure(figsize=(7, 18))
plt.subplot(311)
plt.title("Histogram of quake magnitudes")
plt.hist(quakes["mag"], bins=15, color="blue",
         )
plt.xlabel("Magnitude of quakes")
plt.ylabel("Number of quakes")
plt.axvline(x=4.8, color='red', lw=3, linestyle='--')
plt.subplot(312)
plt.title("Depth of quakes")
plt.boxplot(quakes["depth"])
plt.ylabel("Depth")
plt.axhline(y=400, color='yellow', lw=5)
plt.subplot(313)
plt.plot(quakes["long"], quakes["lat"], '^',color="red")
plt.title("Positions of quakes")
plt.xlabel("Longitude")
plt.ylabel("Latitude")
plt.gca().add_patch(patches.Rectangle((172, -20),
                10,
                -10,
                edgecolor='Blue',
                fill = False, lw=3))
plt.show()

