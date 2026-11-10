# Week 3 LinkedIn draft

My next-state predictor scored 100% on the original test cases. I kept it in shadow mode.

Week 3 of my Predictive Context Voice Runtime Lab compared rules, graph-transition lookup and a small transcript-only logistic-regression model.

All three matched the expected next state on 40 synthetic challenge turns. But the speech-recognition revision test told a different story: the learned model fell to 70% accuracy and made four high-confidence errors.

The simple controls stayed stable because they were given correct scenario and conversation-state information. That is useful fallback evidence, but it is a different problem from predicting directly from language.

I also tested what happens when graph transitions disappear. Coverage fell as edges were removed, even though the remaining lookups stayed correct. Accuracy on covered cases can hide missing coverage.

The decision: continue the learned predictor as a shadow experiment, with deterministic and reactive fallbacks. Strengthen transcript-revision handling and collect independent evidence before considering activation.

Jev is integrated through a shadow-only adapter, but has no live matched results yet. Its performance remains unmeasured.

These are small, source-related synthetic experiments. Local predictor timings do not measure live voice latency, and a candidate package does not authorize deployment.

The useful Week 3 result was finding the failure that a perfect base score missed.

#VoiceAI #AIEngineering #ModelEvaluation #KnowledgeGraphs
