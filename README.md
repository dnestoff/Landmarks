# Landmarks

Built in Xcode Version: 13.1

Landmarks is an iOS app that lets users navigate through a set of landmarks. The functionality includes:

* A tabbed view with "Featured" and "List" tabs ("Featured" is the default tab)
* A "Featured" tab that shows featured landmarks and breaks landmarks up by category (Lakes, Mountains, Rivers)
* A "List" tab that lists landmark names and thumbnails with a toggle to show only favorited landmarks
* A user profile view (accessible from "Featured" tab), where the user can user details, hike badges, and recent hike data
* The ability to edit details of the user profile
* The ability to favorite landmarks (accessible in the "List" view)

This project was built in conjunction with the Landmarks tutorial in Swift: https://developer.apple.com/tutorials/swiftui.

## Running this project

To run this project:

* Clone the repo
* Open the project in Xcode
* Navigate to the ContentView file under the Views group
* Enter live preview mode

## Models and Data

The project has the following models established:

* ModelData
* Landmark
* Profile
* Hike

The project uses two local seed data files:

* hikeData.json
* landmarkData.json

### Example Landmark Data

````
{
    "name": "Turtle Rock",
    "category": "Rivers",
    "city": "Twentynine Palms",
    "state": "California",
    "id": 1001,
    "isFeatured": true,
    "isFavorite": true,
    "park": "Joshua Tree National Park",
    "coordinates": {
        "longitude": -116.166868,
        "latitude": 34.011286
    },
    "description": "Suscipit inceptos est felis purus aenean aliquet adipiscing diam venenatis, augue nibh duis neque aliquam tellus condimentum sagittis vivamus, cras ante etiam sit conubia elit tempus accumsan libero, mattis per erat habitasse cubilia ligula penatibus curae. Sagittis lorem augue arcu blandit libero molestie non ullamcorper, finibus imperdiet iaculis ad quam per luctus neque, ligula curae mauris parturient diam auctor eleifend laoreet ridiculus, hendrerit adipiscing sociosqu pretium nec velit aliquam. Inceptos egestas maecenas imperdiet eget id donec nisl curae congue, massa tortor vivamus ridiculus integer porta ultrices venenatis aliquet, curabitur et posuere blandit magnis dictum auctor lacinia, eleifend dolor in ornare vulputate ipsum morbi felis. Faucibus cursus malesuada orci ultrices diam nisl taciti torquent, tempor eros suspendisse euismod condimentum dis velit mi tristique, a quis etiam dignissim dictum porttitor lobortis ad fermentum, sapien consectetur dui dolor purus elit pharetra. Interdum mattis sapien ac orci vestibulum vulputate laoreet proin hac, maecenas mollis ridiculus morbi praesent cubilia vitae ligula vel, sem semper volutpat curae mauris justo nisl luctus, non eros primis ultrices nascetur erat varius integer.",
    "imageName": "turtlerock"
}
````

### Example Hike Data

````
{
    "name":"Lonesome Ridge Trail",
    "id":1005,
    "distance":4.5,
    "difficulty":3,
    "observations":[
        {
            "elevation":[
                291.65263635636268,
                309.26016677925196
            ],
            "pace":[
                396.08716481908732,
                403.68937873525232
            ],
            "heartRate":[
                117.16351898665887,
                121.95815455919609
            ],
            "distanceFromStart":0
        },
        {
            "elevation":[
                299.24001936628116,
                317.44584350790012
            ],
            "pace":[
                380.19020240756623,
                395.3978319010256
            ],
            "heartRate":[
                117.6410892152911,
                124.82185220506081
            ],
            "distanceFromStart":0.375
        },
        {
            "elevation":[
                303.62145464574394,
                336.05569457646544
            ],
            "pace":[
                380.55927782266116,
                397.60789726832775
            ],
            "heartRate":[
                121.52696452049059,
                127.31525441110122
            ],
            "distanceFromStart":0.75
        },
        {
            "elevation":[
                319.90393365162629,
                346.26966025518789
            ],
            "pace":[
                357.94116421258531,
                398.0750288648062
            ],
            "heartRate":[
                123.75908585923588,
                132.77069404486801
            ],
            "distanceFromStart":1.125
        },
        {
            "elevation":[
                354.17104439267905,
                403.57031216972939
            ],
            "pace":[
                335.07385149392701,
                397.82674381875808
            ],
            "heartRate":[
                130.8235194572915,
                140.55700591418218
            ],
            "distanceFromStart":1.5
        },
        {
            "elevation":[
                357.42992871175124,
                385.92155620623635
            ],
            "pace":[
                395.16168913839374,
                404.60294066527558
            ],
            "heartRate":[
                131.5456052446734,
                134.65984504627627
            ],
            "distanceFromStart":1.875
        },
        {
            "elevation":[
                345.47736721935661,
                363.18776661379422
            ],
            "pace":[
                340.82303041339082,
                404.71689228682374
            ],
            "heartRate":[
                125.1949698433959,
                131.31354363122026
            ],
            "distanceFromStart":2.25
        },
        {
            "elevation":[
                346.23343025200535,
                497.23376445462401
            ],
            "pace":[
                261.27629148816021,
                331.68516208719467
            ],
            "heartRate":[
                131.67810544238606,
                154.26779645311458
            ],
            "distanceFromStart":2.625
        },
        {
            "elevation":[
                491.57378483134391,
                547.49535224251053
            ],
            "pace":[
                296.05298644112088,
                401.14092967732398
            ],
            "heartRate":[
                151.36398089694217,
                166.20454793289232
            ],
            "distanceFromStart":3
        },
        {
            "elevation":[
                472.06803233416338,
                531.92570520228401
            ],
            "pace":[
                395.50830663514012,
                401.67837917543591
            ],
            "heartRate":[
                134.41798110234078,
                151.90886697564241
            ],
            "distanceFromStart":3.375
        },
        {
            "elevation":[
                339.81419476005283,
                461.03832527824829
            ],
            "pace":[
                395.31160487975183,
                404.49550455974907
            ],
            "heartRate":[
                129.97753472415462,
                138.13531094848992
            ],
            "distanceFromStart":3.75
        },
        {
            "elevation":[
                303.1495508565697,
                342.3532820173541
            ],
            "pace":[
                395.02844559698116,
                402.65878340653796
            ],
            "heartRate":[
                127.72304232462609,
                133.26322270764186
            ],
            "distanceFromStart":4.125
        }
    ]
}
````

## Testing

No tests have been written for the project.
