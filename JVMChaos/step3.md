## Simulate JVM Application Faults

Chaos Mesh simulates the faults of JVM application. For more information, please refer to the [official documentation](https://chaos-mesh.org/docs/simulate-jvm-application-chaos/).

The supported fault types are as follows:

- Throw custom exceptions
- Trigger garbage collection
- Increase method latency
- Modify return values of a method
- Trigger faults by setting Byteman configuration files
- Increase JVM pressure

In the following steps, we will create the above fault types of JVM experiments.

You can also use this scenario as a sandbox to create other experiments and experience the growing list of Chaos Mesh features. In the next steps, you will create some experiments.