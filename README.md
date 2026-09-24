# Moira Mailing List Guide

## 1. Create the CSV

Create a CSV file containing one MIT email address per row:

``` text
user1@mit.edu
user2@mit.edu
user3@mit.edu
```

Save the file as: `emails.csv`

## 2. Upload the Files to Athena

From your local terminal, upload both files:

``` bash
scp moira.sh emails.csv YOUR_KERBEROS@athena.dialup.mit.edu:~/
```

Authenticate with MIT when prompted.

## 3. Dial Into Athena

SSH into Athena:

``` bash
ssh YOUR_KERBEROS@athena.dialup.mit.edu
```

## 4. Run the Script

Run:

``` bash
./moira.sh LISTNAME emails.csv
```

Replace `LISTNAME` with your Moira mailing list name.

The script will go through each MIT email in the CSV and add its
Kerberos username to the specified Moira list.
