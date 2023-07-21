During the early days of the CoViD-19 pandemic, the Virginia Department of Health published some basic statistical data about the pandemic in my home state. Unfortunately, there were two main issues which persisted for the first few months:

1. The historical data was only available in the form of dynamic graphs; the raw numbers were only accessible for a day or so.
1. There were occasional invisible updates to past data to correct earlier mistakes.

So, I tossed together a simple bash script to run as a cron job to pull down the raw data every day, leaving it active for a few months until (a) the VDH's handling of the data improved, and (b) it became clear that things were trending far closer to *Contagion* than *The Stand*.