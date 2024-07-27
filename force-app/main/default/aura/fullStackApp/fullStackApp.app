<!-- <aura:application extends="ltng:outApp" access="global">
    implements="ltng:allowGuestAccess"
    <c:fullStackCourse/>
</aura:application> -->

<aura:application access="GLOBAL" extends="ltng:outApp"
    implements="ltng:allowGuestAccess">

    <aura:dependency resource="c:fullStackCourse"/>

</aura:application>