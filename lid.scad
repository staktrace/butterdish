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

brickHeight = brickLength;
lidThickness = (tickMargin / 2);
lidInnerWidth = lipOuterWidth + 2*((tickMargin - lidThickness) / 2);
lidInnerLength = lipOuterLength + 2*((tickMargin - lidThickness) / 2);
lidInnerHeight = brickHeight + wiggleRoom - lipInnerHeight + baseHeight;

difference() {
    union() {
        translate([0, lidInnerLength/2 + lidThickness/2, 0]) {
            cube([lidInnerWidth, lidThickness, lidInnerHeight], true);
        }
        translate([0, -lidInnerLength/2 - lidThickness/2, 0]) {
            cube([lidInnerWidth, lidThickness, lidInnerHeight], true);
        }
        translate([lidInnerWidth/2 + lidThickness/2, 0, 0]) {
            cube([lidThickness, lidInnerLength, lidInnerHeight], true);
        }
        translate([-lidInnerWidth/2 - lidThickness/2, 0, 0]) {
            cube([lidThickness, lidInnerLength, lidInnerHeight], true);
        }
        translate([0, 0, lidInnerHeight/2 + lidThickness / 2]) {
            cube([lidInnerWidth, lidInnerLength, lidThickness], true);
        }
        translate([lidInnerWidth/2, lidInnerLength/2, 0]) {
            cylinder(h=lidInnerHeight, r=lidThickness, center=true, $fn=180);
        }
        translate([-lidInnerWidth/2, lidInnerLength/2, 0]) {
            cylinder(h=lidInnerHeight, r=lidThickness, center=true, $fn=180);
        }
        translate([lidInnerWidth/2, -lidInnerLength/2, 0]) {
            cylinder(h=lidInnerHeight, r=lidThickness, center=true, $fn=180);
        }
        translate([-lidInnerWidth/2, -lidInnerLength/2, 0]) {
            cylinder(h=lidInnerHeight, r=lidThickness, center=true, $fn=180);
        }
        translate([lidInnerWidth/2, 0, lidInnerHeight/2]) {
            rotate(a=[90, 0, 0]) {
                cylinder(h=lidInnerLength, r=lidThickness, center=true, $fn=180);
            }
        }
        translate([-lidInnerWidth/2, 0, lidInnerHeight/2]) {
            rotate(a=[90, 0, 0]) {
                cylinder(h=lidInnerLength, r=lidThickness, center=true, $fn=180);
            }
        }
        translate([0, lidInnerLength/2, lidInnerHeight/2]) {
            rotate(a=[0, 90, 0]) {
                cylinder(h=lidInnerWidth, r=lidThickness, center=true, $fn=180);
            }
        }
        translate([0, -lidInnerLength/2, lidInnerHeight/2]) {
            rotate(a=[0, 90, 0]) {
                cylinder(h=lidInnerWidth, r=lidThickness, center=true, $fn=180);
            }
        }
        translate([lidInnerWidth/2, lidInnerLength/2, lidInnerHeight/2]) {
            sphere(r=lidThickness, $fn=180);
        }
        translate([-lidInnerWidth/2, lidInnerLength/2, lidInnerHeight/2]) {
            sphere(r=lidThickness, $fn=180);
        }
        translate([lidInnerWidth/2, -lidInnerLength/2, lidInnerHeight/2]) {
            sphere(r=lidThickness, $fn=180);
        }
        translate([-lidInnerWidth/2, -lidInnerLength/2, lidInnerHeight/2]) {
            sphere(r=lidThickness, $fn=180);
        }
    }
    cube([lidInnerWidth, lidInnerLength, lidInnerHeight], true);
}