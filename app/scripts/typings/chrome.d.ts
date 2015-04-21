// Type definitions for Chrome 42.0

interface Window{
  define(definition:string, dependencies:string[], fuc): boolean;
}

interface String {
  /**
   * Returns true if the string starts with <find>.
   * @param find String or RegExp to look for at the beginning of the string.
   * @param pos Starting position to start searching, default = 0.
   * @param case_ True for case sensitive, default = true.
   * @returns True if the string starts with `find`.
   * @example
   *   'hello'.startsWith('hell')        -> true
   *   'hello'.startsWith(/[a-h]/)       -> true
   *   'hello'.startsWith('HELL')        -> false
   *   'hello'.startsWith('HELL', false) -> true
   **/
  startsWith(find:string, pos?:number, case_?:boolean): boolean;

  /**
   * @see startsWith
   **/
  startsWith(find:string, case_?:boolean): boolean;

  /**
   * @see startsWith
   **/
  startsWith(find:RegExp, pos?:number, case_?:boolean): boolean;

  /**
   * @see startsWith
   **/
  startsWith(find:RegExp, case_?:boolean): boolean;

  /**
   * Returns true if the string ends with <find>.
   * @param find String or RegExp to find at the end of the string.
   * @param pos Ending position to search for, defaults to the end of the string.
   * @param case_ True for case sensitive, default = true.
   * @returns True if the string ends with <find>.
   * @example
   *   'jumpy'.endsWith('py')         -> true
   *   'jumpy'.endsWith(/[q-z]/)      -> true
   *   'jumpy'.endsWith('MPY')        -> false
   *   'jumpy'.endsWith('MPY', false) -> true
   **/
  endsWith(find:string, pos?:number, case_?:boolean): boolean;

  /**
   * @see endsWith
   **/
  endsWith(find:string, case_?:boolean): boolean;

  /**
   * @see endsWith
   **/
  endsWith(find:RegExp, pos?:number, case_?:boolean): boolean;

  /**
   * @see endsWith
   **/
  endsWith(find:RegExp, case_?:boolean): boolean;

  /**
   * Returns true if the string includes <find>.
   * @param find String to find within the string.
   * @returns True if the string includes <find>.
   * @example
   *   var str = 'To be, or not to be, that is the question.';
   *   str.includes('To be');       // true
   *   str.includes('question');    // true
   *   str.includes('nonexistent'); // false
   *   str.includes('To be', 1);    // false
   *   str.includes('TO BE');       // false
   **/
  includes(find:string): boolean;
}
