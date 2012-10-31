The aui-carousel widget included in the alloy code base did not allow for a custom menu. More recent versions of the aui-carousel widget have this option enabled.

Thus, the custom replacements of these files enables a custom menu. In order for this more recent aui-carousel widget to work with the older aui code base, a line in aui-carousel.js (as well as debug and min versions) had to be changed:
	//getCN = A.getClassName,
	getCN = A.ClassNameManager.getClassName,

