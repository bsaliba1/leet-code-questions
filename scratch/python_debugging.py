import logging
import time

# This is how you do logging
logging.basicConfig(format="{levelname}: {message}", style="{", level=logging.DEBUG)
logger = logging.getLogger(__name__)
logger.info("\n\nLogging")

debugMessage = "Debugging beep boop"
logger.debug(f"{debugMessage}")
infoMessage = "Info-ing beep boop"
logger.info(f"{infoMessage}")
warnMessage = "Warning beep boop"
logger.warning(f"{warnMessage}")

# This is how you do time
logger.info("\n\nTime")
now = time.time()
logger.info(f"current time in seconds {now} (time.time())")
now_ms = time.time() * 1000
logger.info(f"current time in milliseconds {now_ms} (time.time() * 1000)")

# This is how you do string formatting
logger.info("\n\n String Formatting")
logger.info(f"current time truncated at 2 decimals {now:.2f} (:.2f)")
logger.info(f"current time as integer {int(now):d} (:d)")
logger.info(f"current time as string {str(now):s} (:s)")

# This is how sorting works
logger.info("\n\nSorting")
x = [[2,2], [1,3], [1,2]]
logger.info(f"unsorted: {x}")
asc = sorted(x, key=lambda x: x[0]) # ascending
logger.info(f"ascending by first number: {asc}")
desc = sorted(x, key=lambda x: -x[0]) # descending
logger.info(f"descending by first number: {desc}")
multi = sorted(x, key=lambda x: (x[0], x[1])) # multi-factor
logger.info(f"ascending by first and second number: {multi}")

# This is how list comprehension works
logger.info("\n\nList Comprehension")
x = [[1, True], [2, False], [3, True]]
logger.info(f"basic list: {x}")
filteredList = [d for d in x if d[1]]
logger.info(f"filtered list: {filteredList}")
filteredAndModifiedList = [d[0]*2 for d in x if d[1]]
logger.info(f"filtered and modified list: {filteredAndModifiedList}")

# This is how dictionaries work
logger.info("\n\nDictionaries")
d = {}
d["a"] = 1
logger.info(f"dictionary: {d}")
exists = "a" in d
logger.info(f"does 'a' exist in dictionary: {exists}")
del d["a"]
exists = "a" in d
logger.info(f"does 'a' exist in dictionary post delete: {exists}")

# This is how dates and datetimes work
from datetime import date, datetime, timedelta
logger.info("\n\nDates")
today = date.today()
logger.info(f"today: {today}")
tomorrow = today + timedelta(days=1)
logger.info(f"tomorrow: {tomorrow}")

logger.info("\n\nDatetimes")
d1 = datetime.now()
logger.info(f"datetime 1: {d1}")
d2 = d1 - timedelta(minutes=5, seconds=30)
logger.info(f"datetime 2: {d2}")
difference = d1 - d2
difference_s = difference.total_seconds()
difference_m = int(difference_s / 60)
difference_d = difference.days
logger.info(f"difference in seconds: {difference_s}")
logger.info(f"difference in minutes: {difference_m}")
logger.info(f"difference in days: {difference_d}")

# This is how classes work
logger.info("\n\nClasses")
class Person:
    def __init__(self, name, dob):
        self.name = name
        self.dob = dob

myPerson = Person("Michael", date(2026, 1, 1))
logger.info(f"persons name: {myPerson.name}")
logger.info(f"persons dob: {myPerson.dob}")

