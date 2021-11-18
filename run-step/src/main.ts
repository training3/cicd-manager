import * as core from '@actions/core';
import * as exec from '@actions/exec';

async function run(): Promise<void> {
    let stepName: string = core.getInput('step-name');
    let override: string = core.getInput('override');
    stepName = override ? override : stepName;

    let codebase: string = core.getInput('codebase');
    codebase = codebase ? codebase : 'shared';
    let command  = '${GITHUB_ACTION_PATH}/run-step/steps/'
    command += `${codebase}/${stepName}.sh`;

    let options:exec.ExecOptions = {};
    options.listeners = {
        stdout: (data: Buffer) => {
            core.info(data.toString());
        },
        stderr: (data: Buffer) => {
            core.error(data.toString());
        }
    };

    core.info(`Executing RUN STEP ${codebase}/${stepName}.sh`);
    await exec.exec('set | grep GITHUB', [], options);
    await exec.exec(command, [], options);
}

try {
    run()
}
catch(error) {
    core.setFailed(`Run-step: ${core.getInput('step-name')} failed! ` + error);
}
