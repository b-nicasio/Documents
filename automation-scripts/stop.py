import boto3
from datetime import datetime
from datetime import timedelta  

now = datetime.now() - timedelta(hours=4)

current_time = now.strftime("%H:%M") 

print("Current time: ", current_time)

ec2 = boto3.resource('ec2')

def lambda_handler(event, context):

    # Find all the instances that are tagged with Scheduled:True
    filters = [{
            'Name': 'tag:Scheduled',
            'Values': ['True']
        }
    ]

    # Search all the instances which contains scheduled filter
    instances = ec2.instances.filter(Filters=filters)

    stopInstances = []

    # Locate all instances that are tagged to stop.
    for instance in instances:

        for tag in instance.tags:

            if tag['Key'] == 'ScheduleStop':

                if tag['Value'] == current_time:

                    stopInstances.append(instance.id)

                pass

            pass

        pass

    # shut down all instances tagged to stop.
    if len(stopInstances) > 0:
        # perform the stop
        stop = ec2.instances.filter(InstanceIds=stopInstances).stop()
        print(stop)
    pass
