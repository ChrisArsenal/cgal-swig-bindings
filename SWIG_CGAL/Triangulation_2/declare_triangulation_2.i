#ifndef SWIG_CGAL_TRIANGULATION_2_DECLARE_TRIANGULATION_2_I
#define SWIG_CGAL_TRIANGULATION_2_DECLARE_TRIANGULATION_2_I

//Expose a triangulation_2
// --EXPOSEDNAME is the name of the class exposed by SWIG
// --CLASSNAME_PREFIX is the prefixed of the final class exposed by SWIG (different from EXPOSEDNAME if used for a base class instantiation)
// --CPPTYPE is the c++ type of the triangulation
// --POINT_TYPE the name of the class wrapping Point or Weighted_point type
// --WTAG is CGAL::Tag_false if the cpp triangulation is not weighted and CGAL::Tag_true otherwise
%define Declare_triangulation_2_internal(EXPOSEDNAME,CLASSNAME_PREFIX,CPPTYPE,POINT_TYPE,WTAG)
  //Handles
  %template(CLASSNAME_PREFIX##_Face_handle)        SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE>;
  %typemap(javaimports) SWIG_Triangulation_2::CGAL_Vertex_handle %{import CGAL.Kernel.POINT_TYPE;%}
  %template(CLASSNAME_PREFIX##_Vertex_handle)      SWIG_Triangulation_2::CGAL_Vertex_handle<CPPTYPE,POINT_TYPE>;

  //Edge
  %include "std_pair.i"
  %template(CLASSNAME_PREFIX##_Edge) std::pair<SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE>,int>;

  //Triangulations
  %typemap(javaimports)          Triangulation_2_wrapper%{import CGAL.Kernel.POINT_TYPE; import CGAL.Kernel.Ref_int; import CGAL.Kernel.Segment_2; import CGAL.Kernel.Triangle_2; import CGAL.Kernel.Oriented_side; import CGAL.Triangulation_2.Locate_type; import CGAL.Triangulation_2.Ref_Locate_type; import java.util.Iterator; import java.util.Collection;%}
  %template(EXPOSEDNAME)         Triangulation_2_wrapper<CPPTYPE,POINT_TYPE,SWIG_Triangulation_2::CGAL_Vertex_handle<CPPTYPE,POINT_TYPE>,SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE>,WTAG>;

  //Iterators and circulators
  SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Vertex_handle,import CGAL.Kernel.POINT_TYPE;)
  %template(CLASSNAME_PREFIX##_All_vertices_iterator) SWIG_CGAL_Iterator<CPPTYPE::All_vertices_iterator,SWIG_Triangulation_2::CGAL_Vertex_handle<CPPTYPE,POINT_TYPE> >;

  SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Vertex_handle,import CGAL.Kernel.POINT_TYPE;)
  %template(CLASSNAME_PREFIX##_Finite_vertices_iterator) SWIG_CGAL_Iterator<CPPTYPE::Finite_vertices_iterator,SWIG_Triangulation_2::CGAL_Vertex_handle<CPPTYPE,POINT_TYPE> >;

  SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Face_handle,)
  %template(CLASSNAME_PREFIX##_All_faces_iterator) SWIG_CGAL_Iterator<CPPTYPE::All_faces_iterator,SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE> >;

  SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Face_handle,)
  %template(CLASSNAME_PREFIX##_Finite_faces_iterator) SWIG_CGAL_Iterator<CPPTYPE::Finite_faces_iterator,SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE> >;

  SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Edge,)
  %template(CLASSNAME_PREFIX##_All_edges_iterator) SWIG_CGAL_Iterator<CPPTYPE::All_edges_iterator,std::pair<SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE>,int> >;

  SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Edge,)
  %template(CLASSNAME_PREFIX##_Finite_edges_iterator) SWIG_CGAL_Iterator<CPPTYPE::Finite_edges_iterator,std::pair<SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE>,int> >;

  SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,POINT_TYPE,import CGAL.Kernel.POINT_TYPE;)
  %template(CLASSNAME_PREFIX##_Point_iterator) SWIG_CGAL_Iterator<CPPTYPE::Point_iterator,POINT_TYPE>;

  SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Circulator,CLASSNAME_PREFIX##_Face_handle,)
  %template(CLASSNAME_PREFIX##_Line_face_circulator) SWIG_CGAL_Circulator<CPPTYPE::Line_face_circulator,SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE> >;

  SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Circulator,CLASSNAME_PREFIX##_Face_handle,)
  %template(CLASSNAME_PREFIX##_Face_circulator) SWIG_CGAL_Circulator<CPPTYPE::Face_circulator,SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE> >;

  SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Circulator,CLASSNAME_PREFIX##_Edge,)
  %template(CLASSNAME_PREFIX##_Edge_circulator) SWIG_CGAL_Circulator<CPPTYPE::Edge_circulator,std::pair<SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE>,int > >;

  SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Circulator,CLASSNAME_PREFIX##_Vertex_handle,import CGAL.Kernel.POINT_TYPE;)
  %template(CLASSNAME_PREFIX##_Vertex_circulator) SWIG_CGAL_Circulator<CPPTYPE::Vertex_circulator,SWIG_Triangulation_2::CGAL_Vertex_handle<CPPTYPE,POINT_TYPE> >;
%enddef

//Expose a triangulation_2
// --CLASSNAME  is the name of the class exposed by SWIG
// --CPPTYPE is the c++ type of the triangulation
// --POINT_TYPE the name of the class wrapping Point or Weighted_point type
// --WTAG is CGAL::Tag_false if the cpp triangulation is not weighted and CGAL::Tag_true otherwise
%define Declare_triangulation_2(CLASSNAME,CPPTYPE,POINT_TYPE,WTAG)
  Declare_triangulation_2_internal(CLASSNAME,CLASSNAME,CPPTYPE,POINT_TYPE,WTAG)
%enddef

#endif //SWIG_CGAL_TRIANGULATION_2_DECLARE_TRIANGULATION_2_I
