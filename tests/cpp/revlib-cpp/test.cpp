
#include "gtest/gtest.h"
#include "rev/SparkMax.h"

TEST(BasicTest, Basic) {
  rev::spark::SparkMax sparkMax{3, rev::spark::SparkMax::MotorType::kBrushless};
}
