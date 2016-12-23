class Clock:
    hours = 0
    minutes = 0    

    def set_minutes(self, minutes=0):
        self.set_hours(minutes // 60)
        self.minutes = minutes % 60  

    def set_hours(self, hours=0):
        self.hours = hours % 24        

    def __init__(self, hours=0, minutes=0):
        self.set_minutes(minutes)
        self.set_hours(hours)
    
    def add(self, minutes=0):
        self.set_hours(self.hours + minutes // 60)
        self.set_minutes(self.minutes + minutes)

    def __str__(self):
        return  "{:02d}:{:02d}".format(self.hours, self.minutes)
