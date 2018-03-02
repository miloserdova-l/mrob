/* $COPYRIGHT_SKOLTECH
 * $LICENSE_LGPL
 *
 * factor2Poses3d.cpp
 *
 *  Created on: Feb 28, 2018
 *      Author: Gonzalo Ferrer
 *              g.ferrer@skoltech.ru
 *              Mobile Robotics Lab, Skoltech 
 */


#include "factor2Poses3d.hpp"
#include <iostream>

using namespace fg;


Factor2Poses3d::Factor2Poses3d(const Mat61 &observation, std::shared_ptr<Node> &n1,
        std::shared_ptr<Node> &n2, const Mat6 &obsCov):
        Factor(), dim_(6), obs_(observation), Tobs_(observation),
        obsCov_(obsCov), J1_(Mat6::Zero()), J2_(Mat6::Zero())
{
    neighbourNodes_.push_back(n1);
    neighbourNodes_.push_back(n2);
}

Factor2Poses3d::~Factor2Poses3d()
{
}

void Factor2Poses3d::evaluate()
{

}
void Factor2Poses3d::evaluateLazy()
{

}
Mat6 Factor2Poses3d::getJacobian(std::shared_ptr<Node> &n) const
{
    if(neighbourNodes_[0] == n)
        return J1_;
    if(neighbourNodes_[1] == n)
        return J2_;
    else
        // derivatives w.r.t other nodes are 0, regardless of the incorrectness of trying
        // get a Jacobian that does not define the factor
        return Mat6::Zero();
}