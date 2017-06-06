#
# Bialgebroids: Bialgebroids as preadditive categories generated by enhanced quivers
#
# Declarations
#

#! @Chapter Bialgebroids as preadditive categories generated by enhanced quivers

# our info class:
DeclareInfoClass( "InfoBialgebroids" );
SetInfoLevel( InfoBialgebroids, 1 );

####################################
#
#! @Section Categories
#
####################################

#! @Description
#!  The &GAP; category of objects in an algebroid.
DeclareCategory( "IsCapCategoryObjectInAlgebroid",
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in an algebroid.
DeclareCategory( "IsCapCategoryMorphismInAlgebroid",
        IsCapCategoryMorphism );

####################################
#
#! @Section Properties
#
####################################

#! @Description
#!  Is the category <A>A</A> finitely presented.
#!  This property is true by construction for algebroids generated by finite quivers.
#! @Arguments A
DeclareProperty( "IsFinitelyPresentedCategory",
        IsCapCategory );

Add( CAP_INTERNAL_CAN_COMPUTE_FILTER_LIST!.MathematicalPropertiesOfCategories,
     "IsFinitelyPresentedCategory" );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The quiver underlying the algebroid <A>A</A>.
#! @Arguments A
#! @Returns a &QPA; quiver
DeclareAttribute( "UnderlyingQuiver",
        IsCapCategory );

#! @Description
#!  The quiver algebra (=path algebra with relations) underlying the algebroid <A>A</A>.
#! @Arguments A
#! @Returns a &QPA; path algebra
DeclareAttribute( "UnderlyingQuiverAlgebra",
        IsCapCategory );

#! @Description
#!  The finite set of objects of the finitely presented algebroid <A>A</A>.
#! @Arguments A
#! @Returns a list
DeclareAttribute( "SetOfObjects",
        IsCapCategory );

#! @Description
#!  The finite set of morphisms generating the finitely presented algebroid <A>A</A>.
#! @Arguments A
#! @Returns a list
DeclareAttribute( "SetOfGeneratingMorphisms",
        IsCapCategory );

#! @Description
#!  The relations of the algebroid <A>A</A> corresponding to
#!  <C>RelationsOfAlgebra( UnderlyingQuiverAlgebra( <A>A</A> ) )</C>.
#! @Arguments A
#! @Returns a &QPA; path algebra
DeclareAttribute( "RelationsOfAlgebroid",
        IsCapCategory );

#! @Description
#!  The counit of the bialgebroid <A>B</A>.
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "Counit",
        IsCapCategory );

#! @Description
#!  The comultiplication of the bialgebroid <A>B</A>.
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "Comultiplication",
        IsCapCategory );

#! @Description
#!  The vertex of the quiver underlying the object <A>obj</A> in an algebroid.
#! @Arguments obj
#! @Returns a vertex in a &QPA; quiver
DeclareAttribute( "UnderlyingVertex",
        IsCapCategoryObjectInAlgebroid );

#! @Description
#!  The quiver algebra element underlying the morphism <A>mor</A> in an algebroid.
#! @Arguments mor
#! @Returns an element in a &QPA; path algebra
DeclareAttribute( "UnderlyingQuiverAlgebraElement",
        IsCapCategoryMorphismInAlgebroid );

#! @Description
#!  The <A>n</A>-th power of the algebroid <A>A</A>.
#!  Admissible values for <A>n</A> are $0,1,2$.
#! @Arguments A, n
#! @Returns a &CAP; category
DeclareOperation( "POW",
        [ IsCapCategory, IsInt ] );

DeclareAttribute( "BijectionBetweenPairsAndElementaryTensors",
        IsQuiverAlgebra );

DeclareAttribute( "DecompositionOfASecondOrderTensor",
        IsCapCategoryMorphismInAlgebroid );

####################################
#
#! @Section Operations
#
####################################

DeclareOperation( "DecomposeQuiverAlgebraElement",
        [ IsQuiverAlgebraElement ] );

#! @Description
#!  Apply the functor (or a defining record) <A>F</A> to the quiver algebra element <A>p</A>.
#! @Arguments F, path
#! @Returns a morphism in a &CAP; category
DeclareOperation( "ApplyToQuiverAlgebraElement",
        [ IsObject, IsQuiverAlgebraElement ] );

####################################
#
#! @Section Constructors
#
####################################

DeclareGlobalFunction( "ADD_FUNCTIONS_FOR_ALGEBROID" );

#! @Description
#!  Construct the algebroid associated to the path $R$-algebra <A>Rq</A>
#!  of the quiver $q$ modulo the relations <A>L</A> as an $R$-linear category.
#! @Arguments Rq
#! @Returns a &CAP; category
#! @Group Algebroid
DeclareAttribute( "Algebroid",
        IsQuiverAlgebra );

#! @Arguments Rq, L
#! @Group Algebroid
DeclareOperation( "Algebroid",
        [ IsPathAlgebra, IsList ] );

#! @Arguments R, q
#! @Group Algebroid
DeclareOperation( "Algebroid",
        [ IsHomalgRing, IsQuiver ] );

#! @Description
#!  Construct, using the record of images <A>F</A>,
#!  a functor with source the finitely presented algebroid <A>A</A>.
#! @Arguments A, F
#! @Returns a &CAP; functor
DeclareOperation( "CapFunctorFromFinitelyPresentedAlgebroid",
        [ IsCapCategory, IsRecord ] );

#! @Description
#!  Add to the algebroid <A>A</A> a counit and a comultiplication
#!  using the defining records <A>counit</A> and <A>comult</A>, respectively.
#! @Arguments A, counit, comult
#! @Returns a &CAP; category
DeclareOperation( "AddBialgebroidStructure",
        [ IsCapCategory, IsRecord, IsRecord ] );

#! @Description
#!  The constructor of morphisms in an algebroid given the source <A>S</A>,
#!  the target <A>T</A>, and the underlying quiver algebra element <A>path</A>.
#!  If neither <A>S</A> nor <A>T</A> are provided they are read off from <A>path</A>.
#! @Arguments S, path, T
#! @Returns a morphism in a &CAP; category
#! @Group MorphismInAlgebroid
DeclareOperation( "MorphismInAlgebroid",
        [ IsCapCategoryObjectInAlgebroid, IsQuiverAlgebraElement, IsCapCategoryObjectInAlgebroid ] );

#! @Arguments path
#! @Group MorphismInAlgebroid
DeclareOperation( "MorphismInAlgebroid",
        [ IsQuiverAlgebraElement ] );
