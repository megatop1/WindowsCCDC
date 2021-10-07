# Script to sync employees from a CSV file to AD. This script will query each datastore the same way and have each datastore retrurn the same kind of object

# AD has common attributes associated with each user account - like first name, last name, and department. Chances are the source datastore you'd like to sync with will never have
# same exact attributes. If it does even have the same attributes, it might know them by different names. To resolve this issue, you have to build a mapping between 2 different datastores

#Lets build a hashtable in which the key is the attribute name in the first datastore, and the value is the attribute in the 2nd datastore.
# Below, 
