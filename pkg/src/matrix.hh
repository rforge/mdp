#ifndef MATRIX_HPP
#define MATRIX_HPP

#include "basicdt.hh"
#include <iostream>

/** Simpel Dense Rectangular Matrix Class.
 *
 *  - allows 2-d indexing
 *  - inject assignment
 *  - indexing via A(r,c) where r and c are integers
 *  - row/col index are starting from zero
 *  - Stored in an array colum-wise, i.e. A(r,c) is stored in v[rows*c+r].
 *
 */
template<class T>
class MatSimple
{
public:

    /** Constructs a column-wise matrix.
     \note Elements are not initialized!
     \param r Number of rows.
     \param c Number of columns.
     */
    MatSimple(int r, int c) {
        rows = r;
        cols = c;
        v = new T[rows*cols];
    }

    /** Constructs a column-wise square matrix.
     \param identity If true create an identity matrix.
     \param r Number of rows and columns.
     */
    MatSimple(int r, bool identity) {
        rows = cols = r;
        v = new T[rows*cols];
        if (identity) {
            Set(0);
            for(idx i=0; i<rows; i++) v[rows*i+i] = 1;
        }
    }

    /** Copy constructor. */
    MatSimple(const MatSimple & mat) {
        rows = mat.rows;
        cols = mat.cols;
        v = new T[rows*cols];
        Inject(mat);
    }

    /** Deconstructor. */
    ~MatSimple() {
        delete [] v;
    }

    /* Assignment operator. */
    T& operator=(const T & rhs) {
        if (this == &rhs) return *this;
        rows = rhs.rows;
        cols = rhs.cols;
        delete [] v;
        v = new T[rows*cols];
        Inject(rhs);
        return this;
    }

    /** Set all entries to val. */
    void Set(T val) {
        for (idx i=0; i<rows*cols; i++) v[i] = val;
    }

    /** Copy mat. */
    void Inject(const MatSimple & mat) {
        for (idx i=0; i<rows*cols; i++) v[i] = mat(i);
    }

    /** Multiply the matrix with -1. */
    void MultWithMinusOne() {
        for (idx i=0; i<rows*cols; i++) v[i] = -v[i];
    }

    /* Get entry (r,c). */
    T& operator()(int r, int c) {
       return v[rows*c+r];
    }

    /* Get entry (r,c). */
    T& operator()(int r, int c) const {
       return v[rows*c+r];
    }

    /* Get entry (r,c). */
    T& operator()(int i) const {
       return v[i];
    }

    void Print() {
        for(idx r=0;r<rows;r++) {
            for(idx c=0;c<cols;c++) cout << v[rows*c+r] << "\t";
            cout << endl;
        }
        cout << endl;
    }

    uInt rows;     ///< Number of rows.
    uInt cols;     ///< Number of cols.

private:
    T * v;   ///< Array of T's used to store the matrix column-wise.
};

typedef class MatSimple<int> * IntMatPtr;

#endif

