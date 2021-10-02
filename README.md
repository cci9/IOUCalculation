# IOU Calculation for 2D Quadrilaterals
The major functional components of autonomous vehicles are perception, control,
planning, system management, and localization. Perception is a process that senses the
surrounding environment using various sensors like Radars, LiDARs, Ultrasonic and
Cameras sensors.
Sensors are designed to extract information from the environment and hence, to perceive the surroundings.
•         Lidars are used to extract the information on the position and shape of surrounding obstacles within its range and field of view (FOV).
•         Camera sensor data provides information about the object class.
•         Radars are used to derive the position and velocity of the obstacles and so on.
Multi-sensor fusion integrates the sequence of observations from a number of heterogeneous sensors into a single best estimate of the state of the environment.
 
One of the Sensor Fusion outputs is the IOU (Intersection over Union) or Jaccard index during the object detection. When the object detection is performed through more than one source of sensors (such as Ultrasonic and Camera sensors), the IOU or Jaccard index is calculated to quantify the percent overlap from two different sources of sensors.
The basic problem in multi-sensor fusion systems is to integrate a sequence of
observations from a number of different sensors into a single best estimate of the state
of the environment.
In such a case, the IOU helps to identify the overlap area, which is captured from the multi-sensors.
For example for the Autonomous Parking Functionality of ADAS (Autonomous Driving Assistance System), the Ultrasonic and Camera sensors are capturing the free space for Ego Vehicle Parking (as shown in the below figure). As per the capability and mounting position of different sensors, the available parking space is captured. The captured area from different sensors may or may not be the same. In that case, the IOU or Jaccard Index helps to quantify the overlap area detected by two different sensors. 

The IOU or Jaccard Index is calculated as follows:

The IOU (Intersection over Union) value varies between 0 to 1. More the overlap region better the IOU value.  Henceforth the confidence in the input data from the sensors increases. Lower the IOU, troubles in deciding the available space for the parking as different sensors are showing different spaces for parking.

Note: Decision of the High Confidence from calculated IOU value varies from application to application. For example, in some applications, High Confidence can be decided over 0.8 IOU value whereas, in some other applications, High Confidence can be decided over 0.9 IOU value.
 
The IOU calculation can be done over the images or coordinates captured from the different sensors.  In addition, the IOU calculation can also be performed considering the captured object as a 2D or 3D object.
 
In this article, I have focused on the IOU calculation based on coordinates received from two different sensors. The captured coordinates would be of 2D Quadrilateral.
Refer to the MATLAB Code for the Calculation of IOU using the X and Y coordinates captured from the two different sensors. The point of interest here is in finding the intersection points and identifying the quadrilateral vertices that lie inside another quadrilateral.
A glimpse of the MATLAB code results:

I have considered all the possible conditions for regular/irregular quadrilateral such as complete overlapping, no overlapping, vertices having negative and positive coordinates, and so on.
