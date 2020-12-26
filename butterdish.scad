// in millimeters
brickWidth = 118;
brickLength = 65;
wiggleRoom = 4;
lipThickness = 2;
lipInnerHeight = 13;
outerLipHeight = 4;
borderWidth = 13;
tickWidth = 1;
tickHeight = 2;
tickMargin = 2;


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

echo("Max dimensions are (mm) ", borderOuterWidth, " by ", borderOuterLength);

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

tick(1/16, 4);
tick(2/16, 6);
tick(3/16, 4);
tick(4/16, 8);
tick(5/16, 4);
tick(6/16, 6);
tick(7/16, 4);
tick(8/16, 10);
tick(9/16, 4);
tick(10/16, 6);
tick(11/16, 4);
tick(12/16, 8);
tick(13/16, 4);
tick(14/16, 6);
tick(15/16, 4);

module tick2(x, tickLength) {
    xpos = (lipInnerWidth * (x - 0.5));
    translate([xpos - (tickWidth/2), -(lipOuterLength / 2) - tickLength - tickMargin, baseHeight - (lipOuterHeight/2)]) {
        cube([tickWidth, tickLength, tickHeight], false);
    }
}

tick2(1/6, 6);
tick2(2/6, 8);
tick2(3/6, 6);
tick2(4/6, 8);
tick2(5/6, 6);