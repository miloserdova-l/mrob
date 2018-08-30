/* $COPYRIGHT_SKOLTECH
 * $LICENSE_LGPL
 *
 * GICP.cpp
 *
 *  Created on: Jan 31, 2018
 *      Author: Gonzalo Ferrer
 *              g.ferrer@skoltech.ru
 *              Mobile Robotics Lab, Skoltech 
 */

#include "skmr/GICP.hpp"

using namespace skmr;

GICP::GICP(const std::shared_ptr<MatX> &X, const std::shared_ptr<MatX> &Y, MatX &CovX, MatX &CovY):
        Base_T(X,Y)
{
}

GICP::~GICP()
{
}

int GICP::solve()
{
    return 1;
}