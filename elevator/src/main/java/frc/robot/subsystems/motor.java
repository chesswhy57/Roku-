// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot.subsystems;
import com.ctre.phoenix6.hardware.TalonFX;

import com.ctre.phoenix6.configs.TalonFXConfiguration;
import com.ctre.phoenix6.controls.DutyCycleOut;
import com.ctre.phoenix6.controls.MotionMagicVoltage;

import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;
import edu.wpi.first.wpilibj2.command.SubsystemBase;

public class motor extends SubsystemBase {
  /** Creates a new motor. */
  TalonFX motor1 = new TalonFX(1);
  TalonFXConfiguration configs = new TalonFXConfiguration();
  double pos =0;
  public motor() {
    var magicmotionconfig = configs.MotionMagic;
    configs.Slot0.kP = 0.3;
    configs.Slot0.kI = 0.000001; 
    configs.Slot0.kD = 0;
    magicmotionconfig.MotionMagicAcceleration = 30;
    magicmotionconfig.MotionMagicCruiseVelocity = 50;
    motor1.getConfigurator().apply(configs);
  }
  public void movePositionMotor(double target){
    pos = target;
    motor1.setControl(new MotionMagicVoltage(target));
  }
  @Override
  public void periodic() {
    // This method will be called once per scheduler run
    SmartDashboard.putNumber("Motor Target", pos);
    pos = SmartDashboard.getNumber("Motor Target", pos);
    //SmartDashboard.putNumber("Motor Position", getPosition());
    //movePositionMotor(pos);
  }
}
