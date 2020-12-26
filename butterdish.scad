// in centimeters
brickWidth = 11.8;
brickLength = 6.5;
wiggleRoom = 0.4;
lipThickness = 0.2;
lipInnerHeight = 1.3;
outerLipHeight = 0.4;
borderWidth = 1.3;
tickWidth = 0.1;
tickHeight = 0.2;
tickMargin = 0.2;


// derived values
lipInnerWidth = brickWidth + wiggleRoom;
lipOuterWidth = lipInnerWidth + (2 * lipThickness);
lipInnerLength = brickLength + wiggleRoom;
lipOuterLength = lipInnerLength + (2 * lipThickness);
lipOuterHeight = lipInnerHeight + lipThickness;
borderOuterWidth = lipOuterWidth + (2 * borderWidth);
borderOuterLength = lipOuterLength + (2 * borderWidth);
baseHeight = (lipOuterHeight - outerLipHeight);
borderRadius = baseHeight - lipThickness;

echo("Max dimensions are ", borderOuterWidth, " by ", borderOuterLength);

difference() {
    union() {
        cube([lipOuterWidth, lipOuterLength, lipOuterHeight], true);
        translate([0, 0, -(lipOuterHeight - baseHeight) / 2]) {
            cube([borderOuterWidth, borderOuterLength, baseHeight], true);
        }

    }
 
    translate([0, 0, lipThickness]) {
        cube([lipInnerWidth, lipInnerLength, lipInnerHeight], true);
    }
    translate([0, borderOuterLength/2, -lipOuterHeight/2]) {
        rotate(a=[0,90,0]) {
            cylinder(h=borderOuterWidth, r=borderRadius, center=true, $fn=180);
        }
    }
    translate([0, -borderOuterLength/2, -lipOuterHeight/2]) {
        rotate(a=[0,90,0]) {
            cylinder(h=borderOuterWidth, r=borderRadius, center=true, $fn=180);
        }
    }
    translate([borderOuterWidth/2, 0, -lipOuterHeight/2]) {
        rotate(a=[90,0,0]) {
            cylinder(h=borderOuterLength, r=borderRadius, center=true, $fn=180);
        }
    }
    translate([-borderOuterWidth/2, 0, -lipOuterHeight/2]) {
        rotate(a=[90,0,0]) {
            cylinder(h=borderOuterLength, r=borderRadius, center=true, $fn=180);
        }
    }
}

module tick(x, tickLength) {
    xpos = (lipInnerWidth * (0.5 - x));
    translate([xpos - (tickWidth/2), (lipOuterLength / 2) + tickMargin, baseHeight - (lipOuterHeight/2)]) {
        cube([tickWidth, tickLength, tickHeight], false);
    }
}

tick(1/16, 0.4);
tick(2/16, 0.6);
tick(3/16, 0.4);
tick(4/16, 0.8);
tick(5/16, 0.4);
tick(6/16, 0.6);
tick(7/16, 0.4);
tick(8/16, 1);
tick(9/16, 0.4);
tick(10/16, 0.6);
tick(11/16, 0.4);
tick(12/16, 0.8);
tick(13/16, 0.4);
tick(14/16, 0.6);
tick(15/16, 0.4);

module tick2(x, tickLength) {
    xpos = (lipInnerWidth * (x - 0.5));
    translate([xpos - (tickWidth/2), -(lipOuterLength / 2) - tickLength - tickMargin, baseHeight - (lipOuterHeight/2)]) {
        cube([tickWidth, tickLength, tickHeight], false);
    }
}

tick2(1/6, 0.6);
tick2(2/6, 0.8);
tick2(3/6, 0.6);
tick2(4/6, 0.8);
tick2(5/6, 0.6);