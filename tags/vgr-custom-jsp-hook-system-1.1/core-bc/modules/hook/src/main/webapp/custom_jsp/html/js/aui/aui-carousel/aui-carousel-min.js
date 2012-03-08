AUI.add("aui-carousel",function(s){var e=s.Lang,r=" ",m="carousel",D=s.ClassNameManager.getClassName,n=D(m,"item"),d=D(m,"item","active"),C=D(m,"item","transition"),b=D(m,"menu","active"),v=D(m,"menu","index"),k=D(m,"menu","item"),c=D(m,"menu","next"),j=D(m,"menu","play"),t=D(m,"menu","pause"),a=D(m,"menu","prev"),y=[k,v].join(r),g=[k,v,b].join(r),u=".",i=u+v,p=u+c,f=u+t,x=u+j,z=[x,f].join(),o=u+a,l=['<li><a class="',k,c,'"></a></li>'].join(r),q=['<li><a class="',k,j,'"></a></li>'].join(r),h=['<li><a class="',k,a,'"></a></li>'].join(r),B=s.Widget.UI_SRC;MAP_EVENT_INFO={src:B};var w=s.Component.create({NAME:m,ATTRS:{activeIndex:{value:0,setter:"_setActiveIndex"},animationTime:{value:0.5},intervalTime:{value:0.75},itemSelector:{value:">*"},nodeMenu:{value:null,setter:"_setNodeMenu"},nodeMenuItemSelector:{value:u+k},playing:{value:true}},prototype:{animation:null,nodeSelection:null,nodeMenu:null,initializer:function(){var A=this;A.animation=new s.Anim({duration:A.get("animationTime"),to:{opacity:1}});},renderUI:function(){var A=this;A._updateNodeSelection();A.nodeMenu=A.get("nodeMenu");A._updateMenuNodes();},bindUI:function(){var A=this;A.after({activeIndexChange:A._afterActiveIndexChange,animationTimeChange:A._afterAnimationTimeChange,itemSelectorChange:A._afterItemSelectorChange,intervalTimeChange:A._afterIntervalTimeChange,nodeMenuItemSelector:A._afterNodeMenuItemSelectorChange,playingChange:A._afterPlayingChange});A._bindMenu();if(A.get("playing")===true){A._afterPlayingChange({prevVal:false,newVal:true});}},syncUI:function(){var A=this;A._uiSetActiveIndex(A.get("activeIndex"));},item:function(E){var A=this;A.set("activeIndex",E);},next:function(){instance._updateIndexNext();},pause:function(){var A=this;A.set("playing",false);},play:function(){var A=this;A.set("playing",true);},prev:function(){var A=this;A._updateIndexPrev();},_afterActiveIndexChange:function(E){var A=this;A._uiSetActiveIndex(E.newVal,{prevVal:E.prevVal,animate:A.get("playing"),src:E.src});},_afterAnimationTimeChange:function(E){var A=this;A.animation.set("duration",E.newVal);},_afterItemSelectorChange:function(E){var A=this;A._updateNodeSelection();},_afterNodeMenuItemSelectorChange:function(E){var A=this;A.nodeMenuItemSelector=E.newVal;A._updateMenuNodes();},_afterIntervalTimeChange:function(E){var A=this;A._clearIntervalRotationTask();A._createIntervalRotationTask();},_afterPlayingChange:function(G){var A=this;var J=A.nodeMenu.one(z);var F=G.newVal;var I=t;var E=j;var H="_clearIntervalRotationTask";if(F){I=j;E=t;H="_createIntervalRotationTask";}A[H]();if(J){J.replaceClass(I,E);}},_bindMenu:function(){var A=this;var E=A.nodeMenu;var F=A.get("nodeMenuItemSelector");E.delegate("click",A._onClickDelegate,F,A);A.nodeMenuItemSelector=F;},_clearIntervalRotationTask:function(){var A=this;clearInterval(A._intervalRotationTask);},_createIndexRandom:function(){var A=this;return Math.ceil(Math.random()*A.nodeSelection.size())-1;},_createIntervalRotationTask:function(){var A=this;A._clearIntervalRotationTask();A._intervalRotationTask=setInterval(function(){A._updateIndexNext({animate:true});},A.get("intervalTime")*1000);},_onAnimationEnd:function(G,H,F,E,I){var A=this;if(F){F.removeClass(C);}H.setStyle("opacity","1");},_onAnimationStart:function(G,H,F,E,I){var A=this;H.addClass(d);if(E){E.addClass(b);}if(F){F.replaceClass(d,C);}if(I){I.removeClass(b);}},_onClickDelegate:function(F){var A=this;F.preventDefault();var G=F.currentTarget;var E;if(G.hasClass(v)){E=A._onMenuItemClick;}else{if(G.hasClass(a)){E=A._updateIndexPrev;}else{if(G.hasClass(c)){E=A._updateIndexNext;}else{if(G.test(z)){E=A._onMenuPlayClick;}}}}if(E){E.apply(A,arguments);}},_onMenuItemClick:function(F){var A=this;F.preventDefault();var E=A.menuNodes.indexOf(F.currentTarget);A.set("activeIndex",E,MAP_EVENT_INFO);},_onMenuPlayClick:function(E){var A=this;this.set("playing",!this.get("playing"));},_renderMenu:function(){var E=this;var A=E.get("activeIndex");var G=[q,h];var I;var J=E.nodeSelection.size();var F="";var H=0;while(H<J){if(H==A){I=g;}else{I=y;}G.push('<li><a class="',I,'">',H++,"</a></li>");}G.push(l);var K=s.Node.create("<menu>"+G.join("")+"</menu>");E.get("contentBox").appendChild(K);return K;},_setActiveIndex:function(E){var A=this;if(E=="rand"){E=A._createIndexRandom();}else{E=Math.max(Math.min(E,A.nodeSelection.size()),-1);}return E;},_setNodeMenu:function(E){var A=this;return s.one(E)||A._renderMenu();},_uiSetActiveIndex:function(F,K){var M=this;var J=null;var H=null;var N=null;var A=null;var L=M.nodeSelection.item(F);var I=M.menuNodes;var E=I.item(F);M.animation.set("node",L);if(K&&!e.isUndefined(K.prevVal)){var G=K.prevVal;L.setStyle("opacity","0");H=I.item(G);J=M.nodeSelection.item(G);J.replaceClass(d,C);M.animation.stop();}else{L.addClass(d);L.setStyle("opacity","1");}N=M.animation.on("start",function(O){M._onAnimationStart(O,L,J,E,H);N.detach();});A=M.animation.on("end",function(O){M._onAnimationEnd(O,L,J,E,H);A.detach();});if(K){if(K.animate){M.animation.run();}else{M.animation.fire("start");M.animation.fire("end");}if(K.src==B&&K.animate){M._createIntervalRotationTask();}}},_updateIndexNext:function(F){var A=this;var E=A.get("activeIndex");var H=A.nodeSelection.size();var G=E+1;if(G>(H-1)){G=0;}F.src=B;A.set("activeIndex",G,F);},_updateIndexPrev:function(F){var A=this;var E=A.get("activeIndex");var G=E-1;if(G<0){G=A.nodeSelection.size()-1;}F.src=B;A.set("activeIndex",G,F);},_updateMenuNodes:function(){var A=this;A.menuNodes=A.nodeMenu.all(i);},_updateNodeSelection:function(){var A=this;var E=A.get("itemSelector");var F=A.get("contentBox").all(E);F.addClass(n);A.nodeSelection=F;},_intervalRotationTask:null}});s.Carousel=w;},"@VERSION@",{requires:["aui-base","anim"],skinnable:true});