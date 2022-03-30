# Inheritance

 Inheritance is a concept in OOP that allows us to extend

 <p>a class to create another class and have access to all the properties and methods of the original 
 parent class from the handle of a new class object.
 The idea behind this scheme is to allow developers add in new properties and methods into the new class while 
 still maintaining access to the original class members.
 This allows us to make modifications without touching the base class at all.</p>
 
 ExtPacket  is extended  and hence is a child class of Packet. . Being a child class, it inherits properties and methods from its parent. If there exists a function with the same name in both the parent and child class, then its invocation will depend on the type of the object handle used to call that function. In the example below, both Packet  and ExtPacket  have a function called display() . When this function is called by a child class handle, the child class display()  function will be executed. If this function is called by a parent class handle, then the parent class 
display()  function will be executed.
